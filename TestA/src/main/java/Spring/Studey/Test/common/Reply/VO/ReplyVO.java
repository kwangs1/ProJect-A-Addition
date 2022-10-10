package Spring.Studey.Test.common.Reply.VO;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("replyVO")
public class ReplyVO {
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date reg_date;
	private int r_group;
	private int r_depth;
	private double rating;

	
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getR_group() {
		return r_group;
	}
	public void setR_group(int r_group) {
		this.r_group = r_group;
	}
	public int getR_depth() {
		return r_depth;
	}
	public void setR_depth(int r_depth) {
		this.r_depth = r_depth;
	}
	
	
}
