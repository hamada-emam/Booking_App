


## features

## Architecture

- <details><summary>Resource for Architecture </summary>
   - <a href="https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47" > clean architecture article</a>
  
  -

<p>

</p>
</details>

# The architecture folders 
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

