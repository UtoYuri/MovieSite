<?php
namespace Media\Controller;
use Think\Controller;
class SearchController extends Controller {

    /** 
     * 搜索控制器默认动作
     * 重定向首页
     */  
    public function index(){
        $this->redirect('/Media/Index');
    }

    /** 
     * 分页检索API
     * @param string $format 返回数据格式
     * @param int $page 页码
     * @param int $num 页面容量
     * @return 检索结果API
     */  
    public function page($format = 'html'){
        $page       = I('post.page/d', 1);
        $num        = I('post.num/d', 20);

        // 创建小说模型
        $movie_model = D('Movie');

        // 获取小说列表
        $movie_list = $movie_model->get_movie_list($page, $num);

        // 返回检索结果
        if ($format == 'json'){
            $this->ajaxReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $movie_list, 
            ), 'json');
        }else if($format == 'xml'){
            $this->xmlReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $movie_list, 
            ), 'json');
        }else{
            $this->assign('movie_list', $movie_list);
            $this->display('movie-item');
        }
    }

    /** 
     * 按关键字搜索API
     * @param string $format 返回数据格式
     * @param string $key 关键字
     * @param string $field 搜索列
     * @param int $page 页码
     * @param int $num 页面容量
     * @return 检索结果API
     */  
    public function search($format = 'html'){
        $key        = I('post.key', '');
        $field      = I('post.field', '');
        $page       = I('post.page/d', 1);
        $num        = I('post.num/d', 20);

        // 创建小说模型
        $movie_model = D('Movie');

        // 获取小说列表
        $movie_list = $movie_model->search_movie($key, $field, $page, $num);

        // 返回检索结果
        if ($format == 'json'){
            $this->ajaxReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $movie_list, 
            ), 'json');
        }else if($format == 'xml'){
            $this->xmlReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $movie_list, 
            ), 'json');
        }else{
            $this->assign('movie_list', $movie_list);
            $this->display('movie-item');
        }
    }

    /** 
     * 按分类搜索API
     * @param string $format 返回数据格式
     * @param string $category 分类
     * @param int $page 页码
     * @param int $num 页面容量
     * @return 搜索结果API
     */  
    public function rank($format = 'html'){
        $category   = I('post.category', '');
        $page       = I('post.page/d', 1);
        $num        = I('post.num/d', 20);

        // 创建小说模型
        $movie_model = D('Movie');

        // 获取小说列表
        $movie_list = $movie_model->get_rank_list($category, $page, $num);

        // 返回检索结果
        if ($format == 'json'){
            $this->ajaxReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $movie_list, 
            ), 'json');
        }else if($format == 'xml'){
            $this->xmlReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $movie_list, 
            ), 'json');
        }else{
            $this->assign('movie_list', $movie_list);
            $this->display('movie-item');
        }
    }

    /** 
     * 获取分类信息API
     * @param string $format 返回数据格式
     * @return 分类信息
     */  
    public function cate($format = 'html'){

        // 创建小说模型
        $movie_model = D('Movie');

        // 获取小说列表
        $cate_info_list = $movie_model->get_cate_info_list($category, $page, $num);

        // 返回检索结果
        if ($format == 'json'){
            $this->ajaxReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $cate_info_list, 
            ), 'json');
        }else if($format == 'xml'){
            $this->xmlReturn(array(
                'success' => true, 
                'msg' => '获取成功', 
                'data' => $cate_info_list, 
            ), 'json');
        }else{
            $this->assign('cate_info_list', $cate_info_list);
            $this->display('cate-info-item');
        }
    }
}