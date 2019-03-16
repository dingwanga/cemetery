package cn.tiantong.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.tiantong.entity.Muxue;

public interface MuxueDao {
      
	
	//查询墓区中所有墓穴
	List<Muxue> findByMqmcId(
			@Param("mqmcId")
            String mqmcId
			);
	
	
     
	//查询是否使用
	List<Muxue> findAllSy();
		
	
	//查询所有墓穴类别
	List<Muxue> findAllLeiBie();
	
	
	
	//查询是否定墓
	List<Muxue> findAllDm();
	
	//查询总记录数
	int getCount(@Param("mqmcId")
                 String mqmcId,
			     @Param("mxmc")
	              String mxmc,
	              @Param("ryqk")
	              Integer ryqk,
				  @Param("dmpb")
				  Integer dmpb
			);
	
	
	//用分页查询墓区信息
	List<Muxue> findByPage(
			@Param("mqmcId")
            String mqmcId,
			@Param("mxmc")
            String mxmc,
            @Param("ryqk")
            Integer ryqk,
			@Param("dmpb")
			Integer dmpb,
            @Param("start")
			Integer start,
			@Param("pageSize")
			Integer pageSize
			);
	
	
	//查询所有
	List<Muxue> findAll();
	
	
	//墓穴新建
	Integer addMuxue(Muxue muxue);
	
	
	//根据id查询墓穴
	Muxue fingByMuxueId(
			@Param("mxid")
			Integer mxid);
	
	
	Muxue findByMqAndMx( 
			             @Param("mqmcId")
			             String mqmcId,
					     @Param("mxmc")
			             String mxmc);
	
	//墓穴修改
	Integer updateMuxue(Muxue muxue);
	//修改sgdbh不为null
	Integer updateSGDBHForMuxue(Muxue muxue);
	//墓穴删除
	Integer delMuxue(
			@Param("mxid")
			Integer mxid);
	
	//查询墓区中DMPM=0的墓穴
		List<Muxue> findByMqmcIdAndZeroOfDMPB(
				@Param("mqmcId")
	            String mqmcId
				);
	
	//查询墓区名称对应的已定墓的所有墓穴名称_添加施工单
	List<Muxue> queryMxmcByMqmcAndDmpb(@Param("mqmcId") String mqmcId,@Param("dmpb") Integer dmpb);
	//查询墓区名称对应的已定墓的所有墓穴名称_修改施工单
	List<Muxue> queryModifyMxmcByMqmcAndDmpb(@Param("mqmcId") String mqmcId,@Param("dmpb") Integer dmpb,@Param("sgdbhId") String sgdbhId);
	// 根据施工单编号修改墓穴信息
	void updateMuxueBysgdbhId(Muxue muxue);
	//修改sgdbh为null
	void updateSGDBHIsNull(Muxue muxue);
	
	
	//查询墓区中所有cid=null 的墓穴
	List<Muxue> findByMqmcIdAndConcessionList(
			@Param("mqmcId")
            String mqmcId
			);
}
