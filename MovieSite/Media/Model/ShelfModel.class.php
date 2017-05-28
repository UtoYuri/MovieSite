<?php

namespace Media\Model;
use Think\Model;
class ShelfModel extends Model {
    protected $tableName = 'purchase_token'; 

    /** 
     * 商品购买
     * @param int $user_id 用户ID
     * @param string $guid 图书GUID
     * @return bool/array 操作结果
     */  
    public function purchase($user_id, $guid){
        $condition = array(
                'GUID' => $guid,
                'is_active' => true,
            );

        // 获取商品价格信息
        $movie = $this->table('t_movie_info')->where($condition)->field('uid, price, discount')->select();

        if (!count($movie)){
            return false;
        }

        // 判断是否已经购买
        // 没有购买则开始购买
        $condition = array(
                'goods_id' => $movie[0]['uid'],
                'user_id' => $user_id,
            );

        if ((int)$this->where($condition)->field('token')->count() == 0){
            $cost = $movie[0]['price'] - $movie[0]['discount'];
            $data = array(
                    'uorder' => create_order(),
                    'goods_id' => $movie[0]['uid'],
                    'user_id' => $user_id,
                    'price' => $cost,
                    'token' => uniqid(),
                );
            $this->add($data);

            // 修改余额
            $condition = array(
                    'uid' => $user_id,
                );
            $pocket = $this->table('t_user')->where($condition)->field('pocket')->select()[0]['pocket'] - $cost;
            $this->execute("UPDATE t_user SET pocket = ".$pocket." WHERE uid = '".$user_id."'");
        }
        $result = $this->table('t_purchase_token')->where($condition)->field('uorder, token')->select();
        $src = $this->table('t_movie_info')->where(array('uid' => $movie[0]['uid']))->field('src_root, src_path')->select()[0];
        $root = !strlen($src['src_root'])?__ROOT__:$src['src_root'];
        $result[0]['src'] = $root.$src['src_path'];

        return $result[0];
    }

    /** 
     * 找到对应商品id
     * @param int $user_id 用户ID
     * @param string $token 令牌
     * @return bool/array 结果
     */  
    public function get_movie_id($user_id, $token){
        $condition = array(
                'user_id' => $user_id,
                'token' => $token,
            );
        $result = $this->where($condition)->field('goods_id')->select();

        if (!count($result)){
            return false;
        }

        return $result[0]['goods_id'];
    }
}