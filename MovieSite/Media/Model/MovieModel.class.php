<?php

namespace Media\Model;
use Think\Model;
class MovieModel extends Model {
    protected $tableName = 'movie_info'; 

    /** 
     * 分页检索列表
     * @param int $page 页码
     * @param int $num 页面容量
     * @return array 列表
     */  
    public function get_movie_list($page = 1, $num = 20){
        // 获取电影信息
        $result = $this->field('GUID, title, authors, src_root, cover, categorys, price, discount, description, meta_key, meta_desc, update_time')
                        ->order('update_time DESC')
                        ->page($page, $num)
                        ->select();
        return $result;
    }

    /** 
     * 分类检索列表
     * @param string $category 分类
     * @param int $page 页码
     * @param int $num 页面容量
     * @return array 列表
     */  
    public function get_rank_list($category = '', $page = 1, $num = 20){
        $sql = $this->field('GUID, title, authors, src_root, cover, categorys, price, discount, description, meta_key, meta_desc, update_time')
                    ->order('update_time DESC')
                    ->page($page, $num);
        if (strlen($category)){
            $condition = array(
                    'categorys' => array('LIKE', '%'.$category.'%'),
                );
            $sql = $sql->where($condition);
        }
        // 获取分类排行信息
        $result = $sql->select();
        return $result;
    }

    /** 
     * 搜索小说
     * @param string $key 关键字
     * @param string $field 检索字段
     * @param int $page 页码
     * @param int $num 页面容量
     * @return array 详情
     */  
    public function search_movie($key = '', $field = '', $page = 1, $num = 20){
        $condition = array(
                'is_active' => true, 
            );

        if ($field == 'authors'){
            $condition['authors'] = array('LIKE', '%'.$key.'%');
        }elseif ($field == 'title') {
            $condition['title'] = array('LIKE', '%'.$key.'%');
        }else{
            $condition['_complex'] = array(
                    'title' => array('LIKE', '%'.$key.'%'),
                    'authors' => array('LIKE', '%'.$key.'%'),
                    '_logic' => 'OR',
                );
        }

        // 获取电影信息
        $result = $this->where($condition)
                        ->field('GUID, title, authors, src_root, cover, categorys, price, discount, description, meta_key, meta_desc, update_time')
                        ->order('update_time DESC')
                        ->page($page, $num)
                        ->select();
        return $result;
    }

    /** 
     * 已购列表列表
     * @param int $user_id 用户编号
     * @param int $page 页码
     * @param int $num 页面容量
     * @return array 列表
     */  
    public function get_purchased_list($user_id, $page = 1, $num = 20){
        $condition = array(
                    't_purchase_token.user_id' => $user_id,
                );
        $result = $this->table('t_purchase_token')
                    ->field('GUID, title, authors, src_root, cover, categorys, t_movie_info.price, discount, description, meta_key, meta_desc, update_time')
                    ->where($condition)
                    ->join('LEFT JOIN t_movie_info ON (t_purchase_token.goods_id = t_movie_info.uid)')
                    ->order('update_time DESC')
                    ->page($page, $num)
                    ->select();
        return $result;
    }
}