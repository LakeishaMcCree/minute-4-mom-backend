# Minute 4 Mom

*Backend code
*[Frontend Code here](https://github.com/LakeishaMcCree/Minute-4-Mom-frontend)



Structure

Post will have many comments
Comments will belong to a post

User will have many posts

Post
    - Title (string)
    - Author (string)
    - Mood (string/emoji???)
    - Content (string)
    - Likes (integer), default: 0 
    - Date(datetime)

Comments
    - Name of commenter (string)
    - Content (string)
    - Post_id (integer)
    - Helpful(boolean)