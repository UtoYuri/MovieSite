<?php
namespace Media\Controller;
use Think\Controller;
class ShelfController extends Controller {

    /** 
     * 已购控制器默认动作
     * 重定向首页
     */  
    public function index(){
        $this->redirect('/Media/Index');
    }

    /** 
     * 已购信息API
     * @param string $format 返回数据格式
     * @param int $page 页码
     * @param int $num 页面容量
     * @return json 书架结果
     */  
    public function page($format = 'html'){
        $page           = I('post.page/d', 1);
        $num            = I('post.num/d', 20);
        $user_id        = I('session.user_id/d', 0);      
        $session_key    = I('session.session_key', '');        

        // 验证登录状态
        if (strlen($session_key) == 0){
            $err_msg = $err_msg ? $err_msg : '请先登录';
        }

        // 创建用户模型
        $user_model = D('User/User');

        // 验证异地登录
        if (C('CHECK_SESSION_KEY', false)){
            // 获取账户ID
            if ($user_id != $user_model->get_user_id_by_session($session_key)){
                $err_msg = $err_msg ? $err_msg : '您已在其他终端登录，请重新登录';
            }
        }

        // 尚未登录则跳转注册页面
        if ($err_msg){
            $shelf = array();
        }else{
            // 创建已购模型
            $movie_model = D('Movie');
            $shelf = $movie_model->get_purchased_list($user_id, $page, $num);
        }


        // 返回检索结果
        $success = $err_msg ? false : true;
        $msg = $err_msg ? '获取失败' : '获取成功';
        if ($format == 'json'){
            $this->ajaxReturn(array(
                'success' => $success, 
                'msg' => $msg, 
                'data' => $shelf, 
            ), 'json');
        }else if($format == 'xml'){
            $this->xmlReturn(array(
                'success' => $success, 
                'msg' => $msg, 
                'data' => $shelf, 
            ), 'json');
        }else{
            $this->assign('movie_list', $shelf);
            $this->display('Search/movie-item');
        }
    }
}