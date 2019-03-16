package cn.tiantong.util;

import java.util.List;

public class PageBean<T> {

	private int curPageNo; // ��ǰҳ��
	private int totalPage; // ��ҳ��
	private int totalCount; // �ܼ�¼��
	private int pageSize; // ÿҳ��ʾ������
	private List<T> pageList; // ÿҳ��Ӧ�ļ���

	public int getCurPageNo() {
		return curPageNo;
	}

	//�����ж�
	public void setCurPageNo(int curPageNo) {
		if(curPageNo<1)
			this.curPageNo = 1; //����С��1
		else if(curPageNo>totalPage)
			this.curPageNo = totalPage == 0?1:totalPage;
		else
			this.curPageNo = curPageNo;
	}

	//ֻ�������ܼ�¼����pageSize����
	public int getTotalPage() {
		return totalPage;
	}


	public int getTotalCount() {
		return totalCount;
	}

	//�ܼ�¼��������ҳ��
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
