import React from 'react';

const Post = ({posts, loading}) => {
    if(loading) {
        return <h2>...loading</h2>;
    }
    return (
        <ul>
            {posts.map(post => <li key={post.id}>{post.title} 번호체크{post.id}</li>)}
        </ul>
    );
};

export default Post;