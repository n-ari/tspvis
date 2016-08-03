cvs = null
ctx = null

window.addEventListener "load",->
  cvs = document.getElementById "canvas"
  ctx = cvs.getContext "2d"
  ctx.fillStyle = "black"
  ctx.fillRect 0,0,500,500
  do updateVis

SMALL_5 = 0
RAND_20 = 1
TSP_225 = 2
RAND_1k = 3
TECH_30k = 4

n = 30000
type = TECH_30k
small_5_points = []
tsp_225_points = []
points = [small_5_points, rand_20_points, tsp_225_points, rand_1k_points, tech_30k_points]

scale = 1.2

sx = -240
sy = -240

updateVis = ->
  ctx.fillStyle = "black"
  ctx.fillRect 0,0,500,500

  ctx.fillStyle = "yellow"
  for i in [0...points[type].length]
    [x,y] = points[type][i]
    ctx.fillRect x*scale+250+sx,-y*scale+250+sy,1,1
  
  text = document.getElementById("area").value
  text = text.split("\n").join(" ").split(" ")
  m = Math.floor(text.length/2)
  ctx.strokeStyle = "white"
  for i in [0...m]
    s = text[2*i]  ^0
    t = text[2*i+1]^0
    if s>=n or t>=n
      alert "Error"
      return
    do ctx.beginPath
    ctx.moveTo points[type][s][0]*scale+250+sx, -points[type][s][1]*scale+250+sy
    ctx.lineTo points[type][t][0]*scale+250+sx, -points[type][t][1]*scale+250+sy
    do ctx.stroke
  return

setScale = (sc)->
  scale = sc
  do updateVis

rescale = ->
  setScale (+document.getElementById("scale").value)