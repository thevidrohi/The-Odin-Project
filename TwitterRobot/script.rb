require './auto_follower.rb'

robot = AutoFollower.new
robot.followTime("tennis", 40)
robot.unfollowLast(40)
