package com.Laptop_Website.website_Laptop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.Laptop_Website.website_Laptop.domain.Product;

public class ProductSpec {
    public static  Specification<Product> nameLike(String name)
{

    // name này là name của product
    return (root, query,criteriaBuilder)-> criteriaBuilder.like(root.get("name"),"%"+name+"%" );
}



public static Specification<Product> minPrice(int minPrice)
{
     return (root, query,criteriaBuilder)-> criteriaBuilder.greaterThanOrEqualTo(root.get("price"),minPrice );
}

public static Specification<Product> maxPrice(int maxPrice)
{
     return (root, query,criteriaBuilder)-> criteriaBuilder.lessThanOrEqualTo(root.get("price"),maxPrice );
}


public static  Specification<Product> findFactory(String name)
{

    return (root, query,criteriaBuilder)-> criteriaBuilder.equal(root.get("factory"),name );
}

public static  Specification<Product> findManyFactory(List<String> listFactory)
{

    return (root, query,criteriaBuilder)-> criteriaBuilder.in(root.get("factory")).value(listFactory) ;
}


public static  Specification<Product> findManyTarget(List<String> listFactory)
{

    return (root, query,criteriaBuilder)-> criteriaBuilder.in(root.get("target")).value(listFactory) ;
}


public static Specification<Product> find1RangePrice(int minPrice, int maxPrice)
{
     return (root, query,criteriaBuilder)-> criteriaBuilder.and(criteriaBuilder.le(root.get("price"),maxPrice ), criteriaBuilder.ge(root.get("price"), minPrice));
}


public static Specification<Product> findManyPrice(int min, int max)
{
    return (root, query,criteriaBuilder)-> criteriaBuilder.between(root.get("price"), min, max);
}

}
