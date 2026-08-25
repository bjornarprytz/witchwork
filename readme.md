# witchwork

game on itch.io: [link](https://thewarlock.itch.io/witchwork)

## TODO

- Push release with `./scripts/push_release.sh`

- [x] Game system
- [ ] Game events (event bus)
- [ ] Game view

### Extra

- itch.io
  - Rename the game
  - Write a short description
  - Make a nice cover image (630x500)
  - Add screenshots (recommended: 3-5)
  - Pick a genre
  - Add a tag or two
  - Publish a devlog on instagram

### Meta

- Not using Steam? Delete `.github/workflows/deploy-to-steam.yml` (disabled by default via an `if: false` stop flag; only enable it if you set up a Steamworks depot and secrets)
- Not using itch.io? Delete `.github/workflows/build-and-publish.yml` (same stop-flag pattern)
- Tackle multiplayer in HTML5
  - https://www.reddit.com/r/godot/comments/bux2hs/how_to_use_godots_high_level_multiplayer_api_with/
- Start a new jam:
  - `./scripts/new_game.sh`
  - Prerequisite:
    - VSCode
    - github CLI (gh)
    - godot
