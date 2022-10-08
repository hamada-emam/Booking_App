

# screenshots for app 
<p align="left">
<img src="https://user-images.githubusercontent.com/95125518/194720280-602ca566-4413-4a0d-a3f1-1ce5fdcd5d72.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720284-c7bca972-c561-493e-b1cc-79c1a9ea7e13.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720287-2d64c72e-8c5b-4958-857e-d5588349a57d.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720292-ab6f405a-1dd0-4e10-b8f0-7b3714f94b82.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720295-c1c6d12e-8e1e-4fe7-9a99-a5a72e4fd70f.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720299-67dd60e4-91f4-4cbf-bf6c-72097fe42ee0.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720300-9d7644dd-42a8-4494-8e65-a3eae48f3899.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720301-7219acf8-0b19-4e20-a708-b5159722d18e.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720303-64fbc933-1fc0-4ec7-98e2-e0afdf7e4f9b.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720307-518e9deb-ef18-45b4-b6f4-d450e5ac5937.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720308-cd8b0873-2da7-4fb2-bfc8-b0a32115c889.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720309-140c4f79-3d34-4964-85a2-4b0cb1a56cd5.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720316-b6e34ecc-dac5-4c96-b113-fc8fb3c2033f.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720318-6d24bdb2-2afb-4d45-a0f3-2c3129163f67.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720230-a81ef1ec-b759-45fb-a0d5-1c72a51f1c12.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720269-40f15e16-2cfb-4324-8df5-02aea6bfa681.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720216-0b04efda-899f-4b16-96d0-7e1628f207ac.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720233-cb6e5118-10c9-4d2e-8144-0033b15eddd4.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720245-6d72b9bb-d8c3-4791-9b75-87ea980ef316.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720247-0f2ceb26-e69a-4b09-b171-f28140d43dc3.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720250-88527f8a-3dc9-48cb-bcfe-c1fd45c9e22e.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720256-090ebe0a-57bb-4191-9693-7ac04f04b6d1.jpg" width=100 hight=150/>
<img src="https://user-images.githubusercontent.com/95125518/194720261-3e8fbed0-7dd1-4dc5-821b-a5f85de15923.jpg" width=100 hight=150/>


</p>
## features


## Architecture

- <details><summary>Resource for Architecture </summary>

   - <a href="https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47" > clean architecture article</a>
   - 
  
  

<p>

</p>
</details>

 


# Architecture Flow diagrame :

```mermaid
graph TD;
    lib-->src;
    lib-->main;
    src--->app
    src--->features
    app-->config
    app-->core
    app-->app.dart
    app-->injector
    config--->routes
    config--->theme
    features--->auth
    features--->booking
    features--->splash
    -
    auth---->data
    auth---->domain
    auth---->presentation
    data--->models
    data--->repositories
    data--->sources
    sources-->local
    sources-->remote
    domain--->entities
    domain--->reposetories
    domain--->usecases
    presentation---->cubit
    presentation---->views
    presentation---->widgets
    cubit-->cubit.dart
    cubit-->state.dart
    -
    booking---->data
    booking---->domain
    booking---->presentation
    data--->models
    data--->repositories
    data--->sources
    sources-->local
    sources-->remote
    domain--->entities
    domain--->reposetories
    domain--->usecases
    presentation---->cubit
    presentation---->views
    presentation---->widgets
    cubit-->cubit.dart
    cubit-->state.dart
    -
    splash---->data
    splash---->domain
    splash---->presentation
    data--->models
    data--->repositories
    data--->sources
    sources-->local
    sources-->remote
    domain--->entities
    domain--->reposetories
    domain--->usecases
    presentation---->cubit
    presentation---->views
    presentation---->widgets
    cubit-->cubit.dart
    cubit-->state.dart
    
     
```

 
<details><summary># The architecture folders </summary>
<p>
<ul>
  <li> lib<br>-->src<br>
       -->main</li>
      <li>src<br>--->app<br>--->features</li>
     <li> app<br>-->config<br>-->core<br> -->app.dart<br> -->injector</li>
     <li> config<br>--->routes<br>--->theme</li>
     <li> features<br>--->auth<ul> -----------------
      <li>auth<br>---->data<br>---->domain<br>---->presentation</li>
     <ul><li> data<br>--->models<br>--->repositories<br>--->sources</li>
     <li> sources<br>-->local<br>-->remote</li>
     <li> domain<br>--->entities<br>--->reposetories<br>--->usecases</li>
     <li> presentation<br>---->cubit<br>---->views<br>---->widgets</li>
        <li>cubit<br>-->cubit.dart<br>-->state.dart</li></ul>
        </ul> <br>--->booking<ul> -----------------
      <li>booking<br>---->data<br>---->domain<br>---->presentation</li>
     <ul><li> data<br>--->models<br>--->repositories<br>--->sources</li>
     <li> sources<br>-->local<br>-->remote</li>
     <li> domain<br>--->entities<br>--->reposetories<br>--->usecases</li>
     <li> presentation<br>---->cubit<br>---->views<br>---->widgets</li>
        <li>cubit<br>-->cubit.dart<br>-->state.dart</li></ul>
        </ul> <br> --->splash<ul> -----------------
      <li>splash<br>---->data<br>---->domain<br>---->presentation</li>
     <ul><li> data<br>--->models<br>--->repositories<br>--->sources</li>
     <li> sources<br>-->local<br>-->remote</li>
     <li> domain<br>--->entities<br>--->reposetories<br>--->usecases</li>
     <li> presentation<br>---->cubit<br>---->views<br>---->widgets</li>
        <li>cubit<br>-->cubit.dart<br>-->state.dart</li></ul>
        </ul> </li>
   -
   
</ul>
</details>



