# FlickerApp 

## Overview

This is a Demo app that utlize [Flicker API ](https://www.flickr.com) to search free images and download them.
The goal for this app is to practice several iOS topics like :


## Tech Stack 

1. Rxswift for the business and UI layer.
2. Callbacks for Networking layer.
3. Kingfisher for Image Operations .
4. UIKit  for Interface .


#### Screens   :

<table>
  <tr>
    <td>Search Screen while Loading  </td>
     <td>Search Screen</td>
     <td>Photo Details Screen</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/16858825/136264127-149a4085-8d0d-48f3-9d56-cbb61d1038f4.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/16858825/136264142-da00e60f-0247-477e-90de-8fd3e64dd6fb.png" width=270 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/16858825/136264184-48ce7c94-9d15-435a-8337-02b3f0376787.png" width=270 height=480></td>
  </tr>
 </table>

### Architecture  Design Patter 

MVVM Design Pattern 

![dataflow](https://user-images.githubusercontent.com/16858825/136261056-613122ac-ea0a-44b7-868a-72321c1a4ed3.png)

### Project Structure 

#### Networking  Group 

This contain the network layer for the App , in which I tried to follow clean Architecture Principles , so fora each module there is Data and Domain layers.
   ** Data Layer : is responsible for defining the Models , Endpoints and Service for the feature  
   ** Domain  Layer : is responsible for exposing the use cases for the feature into protocols. 

Callbacks is used for implementing the API Service and URLSession requests .
<img width="501" alt="Screen Shot 2021-10-06 at 8 30 08 PM" src="https://user-images.githubusercontent.com/16858825/136262063-a1d77cac-02fa-4251-ae75-78fff6c9a723.png">


#### Modules  Group 

This contain the Business and Presentation  layer  for the App (i.e Screen) , each scree is contained Separately  into a Module and `decency injection` is being used to inject any thing this module would need to work.

<img width="571" alt="Screen Shot 2021-10-06 at 8 33 46 PM" src="https://user-images.githubusercontent.com/16858825/136262605-8d92b02f-1c52-47a0-a376-e24302c55a31.png">

-  when navigating pass any thing the. module `PhotoGallery` might need 

<img width="787" alt="Screen Shot 2021-10-06 at 8 34 40 PM" src="https://user-images.githubusercontent.com/16858825/136262729-7908378b-1b89-4d8e-8f2a-124080f1cca3.png">

- when initiating the module , asking it's  dependencies 

<img width="878" alt="Screen Shot 2021-10-06 at 8 36 24 PM" src="https://user-images.githubusercontent.com/16858825/136262967-cf86e9b2-126a-4860-85b4-1aad1780b0f6.png">


#### Data Flow  : 

 -  MVVM + Rxswift  used  to mange Data flow 

example : 

1 . bind UI Component in View Controller 

<img width="797" alt="Screen Shot 2021-10-06 at 8 38 39 PM" src="https://user-images.githubusercontent.com/16858825/136263260-f95518ad-1c0f-4a9a-b1d4-550738581cd9.png">

2. In View Model , Do the Logic to get the Data needed , when get it Emit to the Observable to reflect on the collection View 
<img width="802" alt="Screen Shot 2021-10-06 at 8 40 21 PM" src="https://user-images.githubusercontent.com/16858825/136263515-4f407e74-a6d4-4a7e-a718-df410d8eed06.png">


#### Image Processing    : 

 -  Kingfisher is being used for Handling image Downloading and Caching  




