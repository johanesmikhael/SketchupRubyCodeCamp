mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod
sel = mod.selection

#----------box 1
width = 100.mm
length = 200.mm
height = 300.mm

pt1 = Geom::Point3d.new(0, 0, 0)
pt2 = Geom::Point3d.new(width, 0, 0)
pt3 = Geom::Point3d.new(width, length, 0)
pt4 = Geom::Point3d.new(0, length, 0)

face = ent.add_face(pt1, pt2, pt3, pt4)

if face.normal.z < 0
  face.reverse!
end

face.pushpull(height)

#-----------box 2

width = 300.mm
length = 400.mm
height = 100.mm

pt1 = Geom::Point3d.new(100.mm, 0, 100.mm)
pt2 = Geom::Point3d.new(100.mm + width, 0, 100.mm)
pt3 = Geom::Point3d.new(100.mm + width, length, 100.mm)
pt4 = Geom::Point3d.new(100.mm, length, 100.mm)

face = ent.add_face(pt1, pt2, pt3, pt4)

if face.normal.z < 0
  face.reverse!
end

face.pushpull(height)
