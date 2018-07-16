package cart.model;

public class Cart {

	private String cartid;
	private int cartqty;
	private String prodname;
	private String prodimage;
	private String proddate;
	private String memid;
	private int rownum;
	private int cartprice;
	private int prodid;
	private int prodstock;
	private int prodprice;
	private int cartqtykids;

	public int getCartqtykids() {
		return cartqtykids;
	}

	public void setCartqtykids(int cartqtykids) {
		this.cartqtykids = cartqtykids;
	}

	public int getProdprice() {
		return prodprice;
	}

	public void setProdprice(int prodprice) {
		this.prodprice = prodprice;
	}

	public int getProdstock() {
		return prodstock;
	}

	public void setProdstock(int prodstock) {
		this.prodstock = prodstock;
	}

	public int getProdid() {
		return prodid;
	}

	public void setProdid(int prodid) {
		this.prodid = prodid;
	}

	public int getCartprice() {
		return cartprice;
	}

	public void setCartprice(int cartprice) {
		this.cartprice = cartprice;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
	}

	public String getProdimage() {
		return prodimage;
	}

	public void setProdimage(String prodimage) {
		this.prodimage = prodimage;
	}

	public String getProddate() {
		return proddate;
	}

	public void setProddate(String proddate) {
		this.proddate = proddate;
	}

	public String getCartid() {
		return cartid;
	}

	public void setCartid(String cartid) {
		this.cartid = cartid;
	}

	public int getCartqty() {
		return cartqty;
	}

	public void setCartqty(int cartqty) {
		this.cartqty = cartqty;
	}

	@Override
	public String toString() {
		return "Cart [cartid=" + cartid + ", cartqty=" + cartqty + ", prodname=" + prodname + ", prodimage=" + prodimage
				+ ", proddate=" + proddate + ", memid=" + memid + ", rownum=" + rownum + ", cartprice=" + cartprice
				+ "]";
	}

}
