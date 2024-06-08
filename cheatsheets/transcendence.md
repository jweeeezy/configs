## backend Folder structure

backend/backend/urls.py --> url/path
backend/{ app_name }/views.py --> render function
backend/tournament/models.py --> database models
backend/backend/templates --> html pages

class Meta:
 unique_together --> only one pair is allowed in the DB
--> newer method: models.UniqueConstraint (Django 2.2)

@database_sync_to_async
--> is a python decorator, in this case django channels specific
--> you can define your own decorators

### api-
models.py:
- User class
    - name, age

Urls.py:
- friends
- friends_online_status
- pending_friend_request
- messages
- block
- unblock

views.py:
- friend list
- friends online status
- pending friend request
- get chat messages
- block user
- unblock user

### chat
models.py:
- Message
    - sender, recipient, content, timestamp, friendship
- BlockedUser
    - blocker, blocked

views.py:
- chat

consumers.py:
- ChatConsumer
_ connect
- disconnect
- receive
- chat_message
- save_message
- is_user_blocked

### game

models.py:
- GameResult class
    - user_profile, opponent_profile, user_score, opponent_score, is_win, date_played 

routing.py:

views.py:
- game
- multiplayer
- get_username
- matches

consumers.py:
- GameRoomConsumer
- connect
- disconnect
- send_connected_user
- connected_user
- game_action
- send_game_action
- ball_move
- send_ball_move
- reset_game
- reset_game_remote
- start_game
- start_game_remote
- disconnected
- disconnected_remote
- connected_users
- send_connected_users
