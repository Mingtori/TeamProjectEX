package order.model;

import product.model.Product;

public class Order extends Product{
	private String orderid;
	private int orderqty;
	private String orderuse;
	
	public Order() {
		super();
	}

	public Order(String orderid, int orderqty, int prodid) {
		super();
		this.orderid = orderid;
		this.orderqty = orderqty;
		this.setProdid(prodid);
	}
	
	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getOrderqty() {
		return orderqty;
	}

	public void setOrderqty(int orderqty) {
		this.orderqty = orderqty;
	}

	public String getOrderuse() {
		return orderuse;
	}

	public void setOrderuse(String orderuse) {
		this.orderuse = orderuse;
	}

	
	
}
