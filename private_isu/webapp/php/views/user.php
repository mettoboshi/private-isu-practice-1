<div class="isu-user">
  <div><span class="isu-user-account-name"><?= escape_html($post['account_name']) ?>さん</span>のページ</div>
  <div>投稿数 <span class="isu-post-count"><?= escape_html($post_count) ?></span></div>
  <div>コメント数 <span class="isu-comment-count"><?= escape_html($comment_count) ?></span></div>
  <div>被コメント数 <span class="isu-commented-count"><?= escape_html($commented_count) ?></span></div>
</div>

<?php require __DIR__ . '/posts.php' ?>
