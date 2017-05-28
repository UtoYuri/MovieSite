<?php if (!defined('THINK_PATH')) exit(); if(count($movie_list) == 0): ?><span style="display: block; width: 240px; height: 80px; font-size: 20px; margin: 10px auto;">没有更多...</span>
<?php else: ?>
	<?php if(is_array($movie_list)): $i = 0; $__LIST__ = $movie_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li>
		<span><?php echo (substr($item["categorys"],0,24)); ?></span>
		<a href="javascript:;" media-guid="<?php echo ($item["guid"]); ?>" media-cover="" onclick="purchaseItem(this);">
			<img src="
				<?php if($item["src_root"] == ''): ?>/TTT<?php echo ($item["cover"]); ?>
			    <?php else: ?>
			    	<?php echo ($item["src_root"]); echo ($item["cover"]); endif; ?>
			">
		</a>
		<p><span>(<?php echo ($item["price"]); ?>金币)</span><?php echo (substr($item["title"],0,48)); ?></p>
	</li><?php endforeach; endif; else: echo "" ;endif; endif; ?>