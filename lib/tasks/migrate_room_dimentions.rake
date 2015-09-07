desc "moves Room width:int, height:int, depth:int to Room room_size:string"
task :migrate_room_dimentions => :environment do
  Room.all.each do |room|
    room.room_size = "W:#{room.width} H:#{room.height} D:#{room.depth}"
    room.save(validate: false)
  end
end