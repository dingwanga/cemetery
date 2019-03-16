package cn.tiantong.util;

import java.util.List;

public class PageBean<T> {

	private int curPageNo; // 当前页码
	private int totalPage; // 总页数
	private int totalCount; // 总记录数
	private int pageSize; // 每页显示的数量
	private List<T> pageList; // 每页对应的集合

	public int getCurPageNo() {
		return curPageNo;
	}

	//进行判断
	public void setCurPageNo(int curPageNo) {
		if(curPageNo<1)
			this.curPageNo = 1; //不能小于1
		else if(curPageNo>totalPage)
			this.curPageNo = totalPage == 0?1:totalPage;
		else
			this.curPageNo = curPageNo;
	}

	//只读的由总记录数和pageSize产生
	public int getTotalPage() {
		return totalPage;
	}


	public int getTotalCount() {
		return totalCount;
	}

	//总记录数产生总页数
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		/*if(totalCount%pageSize==0){
			totalPage = totalCount/pageSize ;
		}else{
			totalPage = totalCount/pageSize+1 ;
		}*/
		totalPage = (totalCount%pageSize==0)?(totalCount/pageSize):(totalCount/pageSize+1);
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getPageList() {
		return pageList;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}

	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

}
