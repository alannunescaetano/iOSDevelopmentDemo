
===================================================================
			README file for MayTheForceBeWith TEST
===================================================================

Hi,

Here are some observations about the development of this test:

-> I’ve really put some effort here to develop this, so if something don’t work when you are trying to run it don’t just discard it, please contact me and I’ll be happy to show you running in my computer via Skype or something else.
Phone: (+351) 938 619 415   - Skype: alan.caetano2@hotmail.com - E-mail: alan.caetano3@gmail.com

-> you don't need any special configuration to run this project and the test project in it. I'm using Xcode 11.3.1 (11C504).

 -> The StarWars API is not online, so it was impossible to use it. 
I sent a message to the person that sent me this test, but I got no answer because it is a holiday right now.
In this case, I’ve decided to work in the project assuming a structure and using dummy data.

-> If you want an example how I handle Http Requests you can see the ShareProfileToWebHookService class.

-> I put a sleep command where the data is fetched to the first tableview to be possible to see the infinite scroll implementation.

-> The get commands have not try catch because it is not needed using dummy data, but I assure you that I was going to use when using this kind of resource.

-> I didn’t get the favourite part, so I made a button that changes the dummy data. 

-> The request to the Webhook is in the action/share button in the person controller. 

-> The Webhook test server is https://webhook.site/1a72abae-a2a8-4403-9331-ea3ac5f73e30.
If for some reason you need to generate a new server in https://webhook.site, you can change the constant in the ShareProfileToWebHookService class.

