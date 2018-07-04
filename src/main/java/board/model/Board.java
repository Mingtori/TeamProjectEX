package board.model;

import java.sql.Date;

public class Board {
   private int boardid;
   private String boardsubject;
   private String memid;
   private String boardcateid;
   private int prodid;
   private String boardcontent;
   private int ref;
   private int restep;
   private int relevel;
   private String boardip;
   private String boardimage;
   private Date boardinputdate;
   private int boardreadcount;
   public int getBoardid() {
      return boardid;
   }
   public void setBoardid(int boardid) {
      this.boardid = boardid;
   }
   public String getBoardsubject() {
      return boardsubject;
   }
   public void setBoardsubject(String boardsubject) {
      this.boardsubject = boardsubject;
   }
   public String getMemid() {
      return memid;
   }
   public void setMemid(String memid) {
      this.memid = memid;
   }
   public String getBoardcateid() {
      return boardcateid;
   }
   public void setBoardcateid(String boardcateid) {
      this.boardcateid = boardcateid;
   }
   public int getProdid() {
      return prodid;
   }
   public void setProdid(int prodid) {
      this.prodid = prodid;
   }
   public String getBoardcontent() {
      return boardcontent;
   }
   public void setBoardcontent(String boardcontent) {
      this.boardcontent = boardcontent;
   }
   public int getRef() {
      return ref;
   }
   public void setRef(int ref) {
      this.ref = ref;
   }
   public int getRestep() {
      return restep;
   }
   public void setRestep(int restep) {
      this.restep = restep;
   }
   public int getRelevel() {
      return relevel;
   }
   public void setRelevel(int relevel) {
      this.relevel = relevel;
   }
   public String getBoardip() {
      return boardip;
   }
   public void setBoardip(String boardip) {
      this.boardip = boardip;
   }
   public String getBoardimage() {
      return boardimage;
   }
   public void setBoardimage(String boardimage) {
      this.boardimage = boardimage;
   }
   public Date getBoardinputdate() {
      return boardinputdate;
   }
   public void setBoardinputdate(Date boardinputdate) {
      this.boardinputdate = boardinputdate;
   }
   public int getBoardreadcount() {
      return boardreadcount;
   }
   public void setBoardreadcount(int boardreadcount) {
      this.boardreadcount = boardreadcount;
   }
	@Override
	public String toString() {
		return "Board [boardid=" + boardid + ", boardsubject=" + boardsubject + ", memid=" + memid + ", boardcateid="
				+ boardcateid + ", prodid=" + prodid + ", boardcontent=" + boardcontent + ", ref=" + ref + ", restep="
				+ restep + ", relevel=" + relevel + ", boardip=" + boardip + ", boardimage=" + boardimage
				+ ", boardinputdate=" + boardinputdate + ", boardreadcount=" + boardreadcount + "]";
	}
   
   
}