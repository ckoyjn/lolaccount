package com.guanglumedia.cms.movie.action;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.annotation.AuthEnum;
import com.guanglumedia.cms.annotation.AuthPassport;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.Product;
import com.guanglumedia.cms.movie.service.MovieService;
import com.guanglumedia.cms.movie.service.ProductService;
import com.guanglumedia.util.GetServerRealPathTools;

@Controller
@RequestMapping(value="/cms/movie")
public class MovieAction extends BaseAction{
	Logger log = LoggerFactory.getLogger(MovieAction.class);
	@Autowired
	private MovieService movieservice;
	@Autowired
	private ProductService productservice;
//	@Autowired
//	private InjectService  injectService;
	
	@RequestMapping(value="findmovielist")
	@AuthPassport(AuthEnum.AdminAuth)
	public String FindMovieList(Movie movie,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		log.info("FindMovieList--------");
		request.setCharacterEncoding("UTF-8");
		PagedModelList<Movie> pagedModelList = this.movieservice.findAllMovieList(movie,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("movies", movie);
		return "movie/ListMovie";
	}
	
	@RequestMapping(value="tomodifymovie")
	@AuthPassport(AuthEnum.AdminAuth)
	public String ToModifyMovie(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		log.info("tomodifymovie--------");
		if(id>0){
			Movie movie=movieservice.getMovieById(id);
			model.addAttribute("MovieInfo",movie);
		}
		List<Product>products=productservice.findAllProductList();
		List<String> identifys = GetServerRealPathTools.findAllIdentifys();
		model.addAttribute("identifys", identifys);
		model.addAttribute("products", products);
		model.addAttribute("Edit", edit);
		model.addAttribute("MovieID",id);
		return "movie/ModifyMovie";
	}
	
	

	@RequestMapping(value="modifymovie")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback ModifyMovie(Movie movie,HttpServletRequest request, Model model){
		log.info("modifymovie--------");
		int result=-1;
		String message="更新失败";
		try{
			if(movieservice.findRank(movie.getRank(),movie.getId())<=0){
				if(movieservice.checkMediaID(movie.getMediaID(), movie.getId())<=0){
					result=this.movieservice.UpdateMovie(movie);
				}else{
					message="内部ID不能重复";
				}
			}else{
				message="排序的序号不能相同";
			}
		}catch (Exception e){
			e.printStackTrace();
			message=e.getMessage();
		}
		if(result>0){
			return Feedback.success("更新成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
	@RequestMapping(value="addmovie")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback AddMovie(Movie movie,HttpServletRequest request, Model model){
		log.info("addmovie--------");
		int result=-1;
		String message="添加失败";
		try{	
			//当电影排序的序号不存在相同的时候才进行添加
			if(movieservice.findRank(movie.getRank(),0+"")<=0){
				if(movieservice.checkMediaID(movie.getMediaID(), movie.getId())<=0){
					result=this.movieservice.AddMovie(movie);
				}else{
					message="内部ID不能重复";
				}
			}else{
				message="排序的序号不能相同";
			}
		}catch (Exception e){
			e.printStackTrace();
			message=e.getMessage();
		}
		if(result>0){
			return Feedback.success("添加成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
	@RequestMapping(value="delmovie")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback DelMovie(@RequestParam("id")int id,HttpServletRequest request, Model model){
		log.info("delmovie--------");
		int result=-1;
		String message="删除失败";
		try{
			//查询注入表中是否有该影片数据
			//if(injectService.getInjectByMovieId(id)<=0){
				result=this.movieservice.DelMovie(id);
			//}else{
				//message="请先删除该影片的注入数据，再删除影片信息";
			//}
		}catch (Exception e){
			e.printStackTrace();
			message=e.getMessage();
		}
		if(result>0){
			return Feedback.success("删除成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
    // 根据产品包查价格
    @RequestMapping(value = "findPrice")
    @AuthPassport(AuthEnum.AdminAuth)
    @ResponseBody
    public Feedback findPrice(@RequestParam("vodID") String vodID, HttpServletRequest request, Model model) {
    	log.info("findPrice--------");
        String price = "";
        price = this.movieservice.findPrice(vodID);
        return Feedback.success(price);
    }
//    //内部ID不能重复
//    @RequestMapping(value={"checkMediaID"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
//    public void checkMediaID(@Param("mediaID")String mediaID,HttpServletRequest request, HttpServletResponse response){
//        int result = this.movieservice.checkMediaID(mediaID);
//        writeAjaxResult(response, result>0?"false":"true");
//    }
	
}
