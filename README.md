### Synced
Synced is a fullstack web application built with Ruby on Rails and ReactJS. The purpose of this app is to synchronize music so users can listen to songs at the same time regardless of their location. It is my final project as part of Flatiron School's Software Engineering Bootcamp.

### Motivation
I built Synced because I always imagined a world where people can experience music together and not be bound by spatial constraints. With Synced, people in the same room working, having lunch, or doing any other activity can listen together through their own devices, but furthermore, people across the world can listen to albums together, or a person can throw a multi-location party from one spot.

### Demo 
Link to demo: https://youtube....... remains to be hosted

### Tech / Frameworks

#### Built with
- Ruby on Rails
- ReactJS
- Redux
- Websockets with Rails' ActionCable
- srpotify: https://github.com/guilhermesad/rspotify
- PostgreSQL
- OAuth using Bcrypt & JWT
- Semantic UI
- ParticlesJS: https://github.com/Wufe/react-particles-js

### Features

- Users can:

  - Look up songs seeded in the database, select and play it. 
  - Create / delete playlists.
  - Add / remove songs from a playlist.
  - See which stations are available.
  - See who is online.
  - Broadcast a station.
  - See online stations' activity (artist, song name and album).
  - Join a station and be synced to it.
  - There is no limit on how many people can join a station, but more than four users slows down your machine!

### Installation
- Clone this repository and the frontend found here: https://github.com/camfeghali/synced-frontend
- In backend directory: 
  - Run `rails db:migrate`
  - Run `rails db:seed`
  - Run `rails s`
- In frontend directory:
  - Run `npm install`
  - Run `npm start`
  
### How to use?
- Open two browsers, the second in incognito mode.
- Signup up into a different account in each browser.
- In browser A, navigate to the "lobby" using the navbar up-top.
- In browser B, navigate to "my station" using the navbar.
- in Browser B, select a song, play it, and hit the "Broadcast button"
- In browser A, join into the station, and see how from browser B, you can control browser A's music.
- Share music with friends!

### Bugs and missing features
#### Bugs
- Crashes when users create account with already existing username.
- Crashes when users login with invalid credentials.
##### Bug fixes:
- Must create new dispatch action to handle invalid user creation or login from backend response.
#### Missing features
- Users should be able to add favorites, and see their activity.
- Users should be able to join favorite's stations whether they be hosts or tuned into one.
- Users should be able to continuously play music after clicking on a playlist's song and not have to load a song everytime.
- Implement the full Spotify API and not use the 30 seconds preview urls but complete tracks.

### Credit
I would like to thank my instructional team especially @alexgriff, https://github.com/alexgriff, for their support.
Also the makers of: 
- ParticleJS: https://github.com/Wufe/react-particles-js
- rspotify: https://github.com/guilhermesad

### License

Not really sure, everyone can use it!
  
