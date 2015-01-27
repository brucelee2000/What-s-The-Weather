# What-s-The-Weather
Asynchronous execution on codes for immediate results
-----------------------------------------------------
No need to wait for other in order programs to be finished

        // Submits a block for asynchronous execution on a dispatch queue and returns immediately.
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.weatherLabel.text = weather
            self.blurredView.hidden = false
            self.weatherLabel.hidden = false
        })
