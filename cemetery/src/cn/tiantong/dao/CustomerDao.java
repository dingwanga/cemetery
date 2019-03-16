package cn.tiantong.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.tiantong.entity.Customer;
public interface CustomerDao {
	
	//查询总记录数
		int getCount( @Param("sgdbh")
                      String sgdbh,
                      @Param("lxrxm")
 	                  String lxrxm,
				      @Param("mqmcId")
	                  String mqmcId,
				      @Param("mxmc")
		              String mxmc,
		              @Param("syxm")
		              String syxm,
					  @Param("lxrdh")
		              String lxrdh,
		              @Param("lxrdz")
                      String lxrdz
				);
		
		
		//用分页查询墓区信息
		List<Customer> findByPage(
			      @Param("sgdbh")
	              String sgdbh,
	              @Param("lxrxm")
                  String lxrxm,
			      @Param("mqmcId")
                  String mqmcId,
			      @Param("mxmc")
	              String mxmc,
	              @Param("syxm")
	              String syxm,
				  @Param("lxrdh")
	              String lxrdh,
	              @Param("lxrdz")
                  String lxrdz,
	              @Param("start")
				  Integer start,
				  @Param("pageSize")
				  Integer pageSize
				 );
		
		
	           //查询所有
			    List<Customer> findAllCustomer();
	}
