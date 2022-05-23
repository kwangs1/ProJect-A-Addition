package Spring.Studey.Test.board.VO;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
	private int bno;
	private String title;
	private String content;
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
	
	
}
