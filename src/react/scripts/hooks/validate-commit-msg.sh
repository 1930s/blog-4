#!/usr/bin/env bash

# the $1: .git/COMMIT_MSG is in the root folder
commitMessage=$(cat "../../$1")
validTechFormat="^(Revert[[:space:]]|\[(\#[0-9]{1,5}|TECH)\][[:space:]](🔧chore|♻️refactor|✅test|✨feature|🐛fix|📚docs|🚀performance|📝todo|🎨style|🐛debug):[[:space:]].*)"
validWritingFormat="^(Revert[[:space:]]|(🌞post|㊙draft):[[:space:]].*)"

if [[ ! ${commitMessage} =~ $validTechFormat ]] && [[ ! ${commitMessage} =~ $validWritingFormat ]];
then
  echo "提交信息不合规范，请参考以下提交规则："
  echo ""
  echo "🔨💡🔐 技术类提交 🔪🔫💣"
  echo "  1. 提交信息应以 Github issue 卡号开头，使用尖括号 [] 括起，卡号可为1-5位数；如没有 issue 对应，使用 [TECH] 开头；"
  echo "  2. 卡号后必须带一空格"
  echo "  3. 空格后必须带提交描述，描述类型必须为以下其中一种: 🔧chore, ♻️refactor, ✅test, ✨feature, 🐛fix, 📚docs, 🚀performance, 📝todo, 🎨style, 🐛debug"
  echo "  4. 提交描述后必须带一冒号"
  echo "  5. 冒号后必须带一空格"
  echo "  6. 之后提交信息任写，要求提交信息总共在70个字符内"
  echo ""
  echo "📘📕📗 文章类提交 📔📙📓"
  echo "  1. 如为发布或修改已发布文章，以 🎼post: 开头；"
  echo "  2. 如为草稿或修改草稿文章，以 ㊙draft: 开头；"
  echo "  3. 之后提交信息任写，要求提交信息总共在70个字符内"
  echo ""
  echo "合法的提交信息可参考以下几例："
  echo ""
  echo "[#206] 🔧chore: introduce husky for pre-commit linting"
  echo "[#206] ✨feature: implement PostDetail in a ES6 class manner"
  echo "[TECH] ✅test: use parameterized testing to simplify timeUtil.test.js"
  echo "🌞post: translate Developers Should Abandon Agile"
  echo "㊙draft: initial thought on frontend unit testing"
  exit 1
fi;


messageLength=`echo "${commitMessage}" | head -1 | cat | wc -m | tr -d "[[:space:]]"`
if [[ ${messageLength} -gt 70 ]];
then
  echo ""
  echo "😥😥😥 提交信息长度必须在70个字符之内。当前提交信息长度为：${messageLength} 😥😥😥"
  exit 1
fi

echo "👏👏👏 提交信息格式验证通过 👏👏👏";
exit 0
