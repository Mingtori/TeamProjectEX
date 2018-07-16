package product.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int prodid;

	@NotEmpty(message = "상품명을 입력해주세요.")
	private String prodname;

	@NotEmpty(message = "카테고리를 선택해주세요.")
	private String prodcateid;

	// @NotEmpty(message = "이미지를 선택해주세요")
	private String prodimage;

	private int prodprice;

	private int prodstock;

	private String prodinputdate;

	@NotEmpty(message = "시작 날짜를 입력해주세요.")
	private String prodstartdate;

	@NotEmpty(message = "종료 날짜를 입력해주세요.")
	private String prodenddate;

	@NotEmpty(message = "상세 내용 입력해주세요.")
	private String prodcontent;

	private String prodcatename;

	private MultipartFile upload;
	private String upload2;

	private int rownum;
	private int cnt;
	private int pageNum;

	private String prodplace; // 장소
	private String memplace; // 판매자 + 장소
	// 판매자id;
	private String memid;
	private int kidsprice; // 소인 가격

	public int getKidsprice() {
		return kidsprice;
	}

	public void setKidsprice(int kidsprice) {
		this.kidsprice = kidsprice;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMemplace() {
		return memplace;
	}

	public void setMemplace(String memplace) {
		this.memplace = memplace;
	}

	public String getProdplace() {
		return prodplace;
	}

	public void setProdplace(String prodplace) {
		this.prodplace = prodplace;
	}

	public String getUpload2() {
		return upload2;
	}

	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getProdimage() {
		return prodimage;
	}

	public void setProdimage(String prodimage) {
		this.prodimage = prodimage;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getProdcateid() {
		return prodcateid;
	}

	public void setProdcateid(String prodcateid) {
		this.prodcateid = prodcateid;
	}

	public String getProdinputdate() {
		return prodinputdate;
	}

	public void setProdinputdate(String prodinputdate) {
		this.prodinputdate = prodinputdate;
	}

	public String getProdstartdate() {
		return prodstartdate;
	}

	public void setProdstartdate(String prodstartdate) {
		this.prodstartdate = prodstartdate;
	}

	public String getProdenddate() {
		return prodenddate;
	}

	public void setProdenddate(String prodenddate) {
		this.prodenddate = prodenddate;
	}

	public String getProdcatename() {
		return prodcatename;
	}

	public void setProdcatename(String prodcatename) {
		this.prodcatename = prodcatename;
	}

	public int getProdid() {
		return prodid;
	}

	public void setProdid(int prodid) {
		this.prodid = prodid;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
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

	public String getProdcontent() {
		return prodcontent;
	}

	public void setProdcontent(String prodcontent) {
		this.prodcontent = prodcontent;
	}

	@Override
	public String toString() {
		return "Product [prodid=" + prodid + ", prodname=" + prodname + ", prodcateid=" + prodcateid + ", prodimage="
				+ prodimage + ", prodprice=" + prodprice + ", prodstock=" + prodstock + ", prodinputdate="
				+ prodinputdate + ", prodstartdate=" + prodstartdate + ", prodenddate=" + prodenddate + ", prodcontent="
				+ prodcontent + ", prodcatename=" + prodcatename + ", upload=" + upload + "]";
	}
}
