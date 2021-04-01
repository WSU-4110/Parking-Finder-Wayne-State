import Foundation

struct User
{
    private static var userInstance: User
    init() {} // Force use of getInstance for singleton
    public static 
    public static func getInstance() -> User
    {
        if(userInstance==null)
            userInstance = new User()
        return userInstance
    }

    private static var zoneCurrentlyParked;
    private static var parkTime;

    public static func setParkedZone(zone, time)
    {
        zoneCurrentlyParked = zone
        parkTime = time
        startCountdown()
    }

    private static func startCountdown()]
    {
        var timeLeft = parkTime
        
              Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                  	 print("timer fired!")
                
                	timeLeft -= 1
                
                	self.timerTextField.text = String(timeLeft)
                	print(timeLeft)
                
              	if(timeLeft==0){
                    		timer.invalidate()
                            zoneCurrentlyParked = null
                    	}
               }
    }
}