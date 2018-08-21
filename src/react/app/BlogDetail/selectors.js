import { createSelector } from 'reselect'

const extractor = require('front-matter')

const getPost = (store, ownProps) => {
  return store.detail.posts[ownProps.match.params.id]
}

export const frontMatters = createSelector([getPost], (post) => {
  return extractor(post.trim())
})
