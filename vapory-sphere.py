from vapory import *

light = LightSource([10, 30, -20], [1.3, 1.3, 1.3])
wall = Plane([0, 0, 1], 200, Texture('T_Stone3'))
ground = Plane( [0, 1, 0], 0, Texture('T_Stone4'))
sphere1 =Sphere([-4, 3, 0], 3.0, Texture('T_Stone1'),
                Interior('ior',4))
sphere2 =Sphere([4, 3, 0], 3.0, Texture('T_Stone1'),
                Interior('ior',4))

scene = Scene( Camera("location", [0, 5, -20], "look_at", [1, 3, 0]),
               objects = [ ground,wall, sphere1, sphere2, light],
               included=["colors.inc", "glass.inc", "golds.inc", "metals.inc", "stones.inc", "woods.inc"] )

scene.render("spheres.png", width=1200, height=900 )
