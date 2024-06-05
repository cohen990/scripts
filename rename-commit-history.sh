export FILTER_BRANCH_SQUELCH_WARNING=1
git filter-branch -f --env-filter '
OLD_EMAIL='"$1"'
NEW_NAME="Samantha Cohen"
NEW_EMAIL=samanthacohen294@gmail.com
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
  export GIT_COMMITTER_NAME="$NEW_NAME"
  export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
  export GIT_AUTHOR_NAME="$NEW_NAME"
  export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags 
