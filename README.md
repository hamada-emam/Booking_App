Architecture Flow diagrame :

<<<<<<< HEAD
## features

## Architecture

- <details><summary>Resource for Architecture </summary>
   - <a href="https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47" > clean architecture article</a>
  
  -

<p>

</p>
</details>

- <details><summary>The architecture folders </summary>

<p>

</p>
</details>



=======
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
>>>>>>> 0543b476d6fc164ba0584d9579224ee7bf2e3bd6
