package com.project.telly.service.dao;

import java.util.List;

import com.project.telly.vo.likeShowVO;
import com.project.telly.vo.myLikeShowVO;
import com.project.telly.vo.onelineShowVO;
import com.project.telly.vo.showCommentVO;
import com.project.telly.vo.showVO;

public interface showDAO {
	public int insertShow(showVO vo);
	public List<showVO> showList();
	public showVO selectShow(int num);
	public int updateShow(showVO vo);
	
	public int insertShowComment(showCommentVO vo);
	public int updateShowComment(showCommentVO vo);
	public List<showCommentVO> selectShowComment(int showNum);
	public int deleteShowComment(int num);
	
	public int likeShow(likeShowVO vo);
	public int updateLikeShow(int num);
	public int cancelLikeShow(int num);
	public int deleteLikeShow(likeShowVO vo);
	public int cntShowLikes(int num);
	
	public List<onelineShowVO> oneLineShow(String writer);
	public List<showVO> myUploadShow(String writer);
	public List<myLikeShowVO> myLikeShow(String writer);
	
	public List<showVO> searchShow(String word);
}

