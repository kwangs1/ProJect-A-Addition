package Spring.Studey.Test.Reply.VO;

import org.springframework.stereotype.Component;

@Component("replyVO")
public class ReplyVO {
	private int bno;
	private int rno;
	private String content;
	
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
	
	
}
