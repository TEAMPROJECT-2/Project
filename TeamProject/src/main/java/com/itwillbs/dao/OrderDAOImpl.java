package com.itwillbs.dao;


import org.springframework.stereotype.Repository;


@Repository
public class OrderDAOImpl implements OrderDAO {

//	@Inject
//	private SqlSession sqlSession;
//	
//	private static final String namespace="com.itwillbs.mappers.orderMapper";
	
	
	
	
//	@Override
//	public void insertAddress(OrderDTO orderDTO) {
//		System.out.println("OrderDAOImpl insertAddress()");
//		sqlSession.insert(namespace + ".insertAddress", orderDTO);		
//	}
//
//	@Override
//	public void updateAddress(OrderDTO orderDTO) {
//		System.out.println("OrderDAOImpl updateAddress()");
//		sqlSession.insert(namespace + ".updateAddress", orderDTO);		
//	}
	
//	@Override
//	public void getOrderPriceInfo() {
//	/* 상품 비용 & 적립포인트 */
////	int deliveryCost = 3000;
//		for(ProdDTO order : User) {
//			ordTotalPrice += order.getProdLPrice();
//		}
//	int deliveryCost;
//		/* 배송비용 */
//		if(ordDeliveryPrice >= 30000) {
//			deliveryCost = 0;
//		} else {
//			deliveryCost = 3000;
//		}
//	/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
//		ordFinalPrice = ordTotalPrice + deliveryCost - ordUsepoint - ordCouponDiscountPrice;
//}

}
