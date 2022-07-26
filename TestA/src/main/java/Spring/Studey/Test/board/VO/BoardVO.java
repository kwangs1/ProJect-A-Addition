package Spring.Studey.Test.board.VO;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
	private int bno;
	private String title;
	private String content;
	private int reply_count;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	
	
}
