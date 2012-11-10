Crafty.scene("game", ->
  Crafty.background("#000")

  Crafty.audio.add("music", Crafty.math.randomElementOfArray(Config.music))


  start_line = Crafty.e("2D, DOM, Color").color("#222").attr(x: Config.viewport.center.x + 5 , y: 40 , h: Config.cycle.outerRadius - Config.cycle.innerRadius - 30, w: 2)
  player = Crafty.e("2D, DOM, Color, MoveInCircle, Collision").pivot(Config.viewport.center).onHit("Obstacle",
      -> @crash()
  )
  track  = Crafty.e("Track").pivot(Config.viewport.center).color("#ff0000").player(player).Track()

  track._segments[18]._inner.attach(start_line) #Hack for start_line

  Crafty.e("2D, Canvas, ActionCenter").pivot(Config.viewport.center).onAction( (action)->
    track.currentSegment(10).perform(action)
  )

  Crafty.bind("GameOver", =>
    player.reset()
    track.reset()
  )

  Crafty.audio.play("music")
)

