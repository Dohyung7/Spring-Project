package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private Long num;
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", updateDate=" + updateDate + ", num=" + num + ", replyCnt=" + replyCnt + ", attachList="
				+ attachList + "]";
	}
}
