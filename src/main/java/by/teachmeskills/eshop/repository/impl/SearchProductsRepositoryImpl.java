package by.teachmeskills.eshop.repository.impl;

import by.teachmeskills.eshop.controllers.SearchPageController;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.repository.interfacefolder.SearchProductsRepository;
import org.apache.log4j.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.query.QueryUtils;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class SearchProductsRepositoryImpl implements SearchProductsRepository {
    @PersistenceContext
    public EntityManager entityManager;

    private static final Logger log = Logger.getLogger(SearchProductsRepositoryImpl.class);

    @Override
    public Page<Product> findProductsListByParams(String category, String priceFrom, String priceTo, String search, Pageable pageable) {

        Page<Product> result = null;
        try {
            CriteriaBuilder cb = entityManager.getCriteriaBuilder();
            CriteriaQuery<Product> productCriteria = cb.createQuery(Product.class);
            Root<Product> productRoot = productCriteria.from(Product.class);

            //Constructing list of parameters
            List<Predicate> predicates = new ArrayList<Predicate>();
            if (Optional.ofNullable(category).isPresent()) {
                if (category != "") {
                    predicates.add(
                            cb.equal(productRoot.get("category").get("name"), category));
                }
            }
            if (Optional.ofNullable(search).isPresent()) {
                if (search != "") {
                    predicates.add(cb.or(
                            cb.like(productRoot.get("name"), "%" + search + "%"),
                            cb.like(productRoot.get("description"), "%" + search + "%")));
                }
            }
            if (Optional.ofNullable(priceFrom).isPresent()) {
                if (priceFrom != "") {
                    predicates.add(
                            cb.greaterThanOrEqualTo(productRoot.get("price"), Integer.parseInt(priceFrom)));
                }
            }
            if (Optional.ofNullable(priceTo).isPresent()) {
                if (priceTo != "") {
                    predicates.add(
                            cb.lessThanOrEqualTo(productRoot.get("price"), Integer.parseInt(priceTo)));
                }
            }
            productCriteria.select(productRoot)
                    .where(predicates.toArray(new Predicate[]{}));
            productCriteria.orderBy(QueryUtils.toOrders(pageable.getSort(), productRoot, cb));
            TypedQuery<Product> query = entityManager.createQuery(productCriteria);
            int totalRows = query.getResultList().size();
            query.setFirstResult(pageable.getPageNumber() * pageable.getPageSize());
            query.setMaxResults(pageable.getPageSize());
            result = new PageImpl<>(query.getResultList(), pageable, totalRows);

        } catch (Exception e) {
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
        }
        return result;
    }
}
