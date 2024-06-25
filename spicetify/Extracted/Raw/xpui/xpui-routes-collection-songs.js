"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[8828],{25721:(e,t,a)=>{a.r(t),a.d(t,{default:()=>be});var l=a(79474),r=a(99754),n=a(83648),s=a(32824),i=a(99626),o=a(83856),c=a(14056),u=a(64647),d=a(90495),g=a(82089),f=a(79055),m=a(82372),y=a(98477),p=a(33085),h=a(13411),x=a(7964),k=a(70746),T=a(79130),C=a(71253),j=a(2995),F=a(89124),b=a(87240);function I(e,t,a){const l={uri:e};return(0,C.qq)(l,t),(0,j.Pz)(l,a?.map((e=>(0,F.HI)(e)??null)).filter(b.P)),l}var R=a(16323),S=a(26271),D=a(64658),P=a(67302),w=a(90661),A=a(62166),E=a(31350),L=a(80964),v=a(28049),M=a(35430),N=a(86892),_=a(82031),U=a(8819),B=a(42232),O=a(53886);var $=a(66615),q=a(82052);const z="liked-songs-tags";function V(){return(0,q.x)("liked-songs-current-tag-filter",null)}var H=a(22215),K=a(81643),Q=a(87465),X=a(92585),Z=a(95063),W=a(77564),Y=a(82548),G=a(97997),J=a(5513),ee=a(36833),te=a(19498),ae=a(67976),le=a(71132),re=a(60347),ne=a(76816),se=a(39950),ie=a(8092),oe=a(13274);const ce=l.memo((({tracklistDomRef:e})=>{const{spec:t,logger:a}=(0,P.r)(re.E,{}),r=(0,l.useCallback)((()=>{a.logInteraction(t.filterFieldFactory().keyStrokeFilter())}),[a,t]),n=(0,l.useCallback)((()=>{a.logInteraction(t.filterFieldFactory().hitClearFilter())}),[a,t]),s=(0,ne.w)().filter((e=>y.gc.includes(e)));return(0,oe.jsxs)("div",{className:f.A.searchBoxContainer,children:[(0,oe.jsx)(l.Suspense,{fallback:null,children:(0,oe.jsx)(se.S,{placeholder:c.Ru.get("playlist.search_in_playlist"),clearOnEscapeInElementRef:e,onFilter:r,onClear:n})}),(0,oe.jsx)(ie.d,{columns:s})]})}));var ue=a(97500),de=a.n(ue),ge=a(26902),fe=a(14494);const me="q_yjkS1y6URH4Xm7gZfw",ye=e=>({id:e.filter,getName:()=>e.name,ubiId:e.name}),pe=(0,l.memo)((({spec:e,nrTracks:t})=>{const{tags:a,currentTag:r,setCurrentTag:n}=function({nrTracks:e}){const t=(0,$.t)(),a=(0,L.jE)(),[r,n]=V(),[s,i]=(0,l.useState)([]),{data:o}=(0,v.I)({queryKey:[z],queryFn:()=>t?.getTracksFilterTags(),staleTime:0,gcTime:864e5,placeholderData:M.rX,refetchOnWindowFocus:!1});(0,l.useLayoutEffect)((()=>{const t=o?.find((e=>e.filter===r));if(!t&&r){if(e>0&&o?.length)return;n(null)}i(o??[])}),[r,n,e,o]);const c=(0,l.useCallback)((({data:{list:e}})=>{e===_.Ir.TRACKS&&a.invalidateQueries({queryKey:[z]})}),[a]);(0,U.l)(_.UV.UPDATE,c);const u=(0,l.useMemo)((()=>s.find((e=>e.filter===r))),[r,s]),d=(0,l.useCallback)((e=>{n(e?.filter??null)}),[n]);return{tags:r||e?s:[],currentTag:u,setCurrentTag:d}}({nrTracks:t}),s=(0,fe.s)(),i=(0,l.useCallback)(((t,l,r)=>{let i;if(!t)return i=e.clearButtonFactory().hitClearFilter(),void s.logInteraction(i);const o=a.find((({filter:e})=>e===t));if(!o)return;const c=e.filterChipFactory({identifier:o.name,position:r});l?(i=c.hitClearFilter(),n(null)):(i=c.hitFilter(),o&&n(o)),s.logInteraction(i)}),[s,n,e,a]),o=r?[]:a.map(ye),u=r?[ye(r)]:[];return a.length?(0,oe.jsx)(J.S,{children:(0,oe.jsx)(ge.s,{availableFilters:o,selectedFilters:u,toggleFilterId:()=>{},resetFilterIds:()=>n(null),onFilterClick:i,ariaLabel:c.Ru.get("web-player.liked-songs.liked-songs-filter-tags"),clearBtnAriaLabel:c.Ru.get("web-player.liked-songs.clear-filter"),className:de()(me),applyLightThemeControls:!0})}):null})),he="ivuDaTbfBpBewwr39aDQ",xe=l.memo((function({metadata:e,onClickTogglePlay:t,isPlaying:a,spec:r,logger:n,backgroundColor:s,canSort:i,canFilter:o}){const{uri:u,name:d,totalLength:g}=e,f=(0,l.useRef)(null),m=(0,l.useMemo)((()=>r.actionBarFactory()),[r]),y=(0,l.useMemo)((()=>m.shuffleButtonContainerFactory()),[m]),p=(0,l.useMemo)((()=>m.filtersFactory()),[m]),h=g>0,x=g>0,k=i&&o,T=(0,le.X)(),C=(0,l.useCallback)(((e,t)=>{const a=m.downloadButtonFactory();t===W.NV.ADD?n.logInteraction(a.hitDownload({itemToDownload:u})):t===W.NV.REMOVE?n.logInteraction(a.hitRemoveDownload({itemToRemoveFromDownloads:u})):t===W.NV.NO_PERMISSION&&n.logInteraction(a.hitUiReveal())}),[m,n,u]),j=(0,ee.j)(),F=(0,H.NC)(te.cLA);return(0,oe.jsxs)(G.E,{backgroundColor:s,children:[(0,oe.jsxs)(J.S,{children:[x?(0,oe.jsx)(X.D,{onClick:t,isPlaying:a,size:j,uri:u,ariaPauseLabel:c.Ru.get("playlist.a11y.pause",d),ariaPlayLabel:c.Ru.get("playlist.a11y.play",d)}):null,T&&(0,oe.jsx)(D.r,{spec:y,children:(0,oe.jsx)(ae.Y,{entityName:d,contextUri:u,activationPlacement:"bottomEnd",size:j})}),(0,oe.jsx)(K.f,{uri:u,canDownload:h,isFollowing:!0,onFollow:()=>{},size:j,onClick:C}),k?(0,oe.jsx)(D.r,{spec:m,children:(0,oe.jsx)(ce,{tracklistDomRef:f})}):(0,oe.jsx)("div",{className:he,children:(0,oe.jsx)(Q.u,{property:Y.mA,renderNewExperience:()=>(0,oe.jsx)(Z.g,{options:[],onSelect:()=>{},selected:null,enableViewModeMenu:!0})})})]}),F&&(0,oe.jsx)(pe,{spec:p,nrTracks:g})]})}));var ke=a(85960),Te=a(24608);const Ce=[h.$.INDEX,h.$.TITLE_AND_ARTIST,h.$.ALBUM,h.$.ADDED_AT,h.$.DURATION],je=({data:e,canFilter:t,canSort:a})=>{const{uri:r,name:o,totalLength:C}=e.metadata,j=(0,l.useRef)(null),F=(0,T.z)("#5038a0"),[R]=V(),{filter:E}=(0,l.useContext)(m.g),{sortState:L,setSortState:v}=(0,l.useContext)(y.cL),{spec:M,logger:N}=(0,P.r)(i.k,{data:{uri:r}}),_=l.useMemo((()=>M.headerFactory()),[M]),U=l.useMemo((()=>M.tracklistFactory()),[M]);(0,l.useEffect)((()=>{null===L.column&&v({column:h.$.ADDED_AT,order:h.H.DESC})}),[L,v]);const B=(0,n.wQ)(),O=(0,n.zy)(),$="POP"!==B?new URLSearchParams(O.search).get("uri"):null,{isPlaying:q,togglePlay:z,usePlayContextItem:H,isActive:K}=(0,S.P)(I(r,(0,ke.c)(L),[E,R].filter(b.P)),{featureIdentifier:"your_library",referrerIdentifier:"your_library"}),Q=()=>{const e=(0,A.$I)({isPlaying:q,isActive:K,spec:M.actionBarFactory().playButtonFactory(),logger:N,uri:r});z({loggingParams:e})},[X]=(0,w.z1)(),{isCompactMode:Z}=(0,k.a)(),W=(({isCompactMode:e=!1})=>{const t=[...Ce];return e&&t.splice(t.indexOf(h.$.TITLE_AND_ARTIST),1,h.$.TITLE,h.$.ARTIST),t})({isCompactMode:Z});return(0,oe.jsx)(p.a,{columns:W,children:(0,oe.jsxs)("section",{role:"presentation",className:f.A.playlist,"data-testid":"playlist-page",children:[(0,oe.jsx)(u.Q,{children:c.Ru.get("playlist.page-title",o)}),(0,oe.jsx)(x.x,{metadata:{...e.metadata,hasSpotifyTracks:!0},totalItems:X,isPlaying:q,togglePlay:Q,backgroundColor:F,specLikedSongs:_}),(0,oe.jsx)(xe,{metadata:e.metadata,onClickTogglePlay:Q,isPlaying:q,spec:M,logger:N,backgroundColor:F,canSort:a,canFilter:t}),(0,oe.jsx)("div",{className:"contentSpacing",children:C>0?(0,oe.jsx)(l.Suspense,{fallback:(0,oe.jsx)(g.A,{hasError:!1,errorMessage:c.Ru.get("error.request-collection-tracks-failure")}),children:(0,oe.jsx)(D.r,{spec:U,children:(0,oe.jsx)(Te.b,{nrTracks:C,collectionUri:r,scrollToUri:$,usePlayContextItem:H,outerDomRef:j,spec:U,initialItems:e.contents.items,isCompactMode:Z,tagFilter:R})})}):(0,oe.jsx)(d.p,{message:c.Ru.get("collection.empty-page.songs-subtitle"),title:c.Ru.get("collection.empty-page.songs-title"),linkTo:"/search",linkTitle:c.Ru.get("collection.empty-page.songs-cta"),renderInline:!0,children:(0,oe.jsx)(s.v,{"aria-hidden":"true"})})})]})})},Fe=l.memo((function({user:e,uri:t}){const{filter:a}=(0,l.useContext)(m.g),{sortState:r}=(0,l.useContext)(y.cL),[n]=V(),s=function(e,t,a){const r=(0,l.useContext)(R.Z),n=(0,L.jE)(),s=(0,N.U0)((()=>["useLikedSongs",e,a]),[e,a]),{data:i}=(0,v.I)({queryKey:s(),queryFn:()=>r.getTracks(a),gcTime:18e5,placeholderData:M.rX,refetchOnWindowFocus:!1}),o=(0,l.useCallback)((()=>{n.invalidateQueries({queryKey:s()})}),[n,s]);(0,U.l)(_.UV.UPDATE,o);const c=(0,O.$R)(t.id);return c&&i?{metadata:{uri:e,name:c.name,images:c.images,totalLength:i?.totalLength,unfilteredTotalLength:i.unfilteredTotalLength,owner:(0,B.w)(t)},contents:i}:null}(t,e,{offset:0,limit:25,sort:(0,ke.c)(r),filters:[a,n].filter(b.P)}),i=(0,l.useContext)(R.Z).getCapabilities();return s?(0,oe.jsx)(je,{data:s,canFilter:i.canFilterTracksAndEpisodes&&s.metadata.unfilteredTotalLength>0,canSort:i.canSortTracksAndEpisodes&&s.metadata.unfilteredTotalLength>0}):(0,oe.jsx)(g.A,{hasError:!1,errorMessage:c.Ru.get("error.not_found.title.playlist"),loadOffline:i.canModifyOffline})})),be=()=>{const{user:e}=(0,r.d4)(E.Ht);if(null===e)return null;const t=(0,o.fH)(e.id).toURI();return(0,oe.jsx)(y.sn,{uri:t,children:(0,oe.jsx)(m.s,{uri:t,children:(0,oe.jsx)(w.S1,{children:(0,oe.jsx)(Fe,{uri:t,user:e})})})})}}}]);
//# sourceMappingURL=xpui-routes-collection-songs.js.map