(define (problem p500)
  (:domain gripper )
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 b231 b232 b233 b234 b235 b236 b237 b238 b239 b240 b241 b242 b243 b244 b245 b246 b247 b248 b249 b250 b251 b252 b253 b254 b255 b256 b257 b258 b259 b260 b261 b262 b263 b264 b265 b266 b267 b268 b269 b270 b271 b272 b273 b274 b275 b276 b277 b278 b279 b280 b281 b282 b283 b284 b285 b286 b287 b288 b289 b290 b291 b292 b293 b294 b295 b296 b297 b298 b299 b300 b301 b302 b303 b304 b305 b306 b307 b308 b309 b310 b311 b312 b313 b314 b315 b316 b317 b318 b319 b320 b321 b322 b323 b324 b325 b326 b327 b328 b329 b330 b331 b332 b333 b334 b335 b336 b337 b338 b339 b340 b341 b342 b343 b344 b345 b346 b347 b348 b349 b350 b351 b352 b353 b354 b355 b356 b357 b358 b359 b360 b361 b362 b363 b364 b365 b366 b367 b368 b369 b370 b371 b372 b373 b374 b375 b376 b377 b378 b379 b380 b381 b382 b383 b384 b385 b386 b387 b388 b389 b390 b391 b392 b393 b394 b395 b396 b397 b398 b399 b400 b401 b402 b403 b404 b405 b406 b407 b408 b409 b410 b411 b412 b413 b414 b415 b416 b417 b418 b419 b420 b421 b422 b423 b424 b425 b426 b427 b428 b429 b430 b431 b432 b433 b434 b435 b436 b437 b438 b439 b440 b441 b442 b443 b444 b445 b446 b447 b448 b449 b450 b451 b452 b453 b454 b455 b456 b457 b458 b459 b460 b461 b462 b463 b464 b465 b466 b467 b468 b469 b470 b471 b472 b473 b474 b475 b476 b477 b478 b479 b480 b481 b482 b483 b484 b485 b486 b487 b488 b489 b490 b491 b492 b493 b494 b495 b496 b497 b498 b499 b500 - ball )
  (:init (at-robby roomA) (free left) (free right) ( next-ball b1 ) ( at b500 roomB ) 
     (succ-balls b1 b2)
     (succ-balls b2 b3)
     (succ-balls b3 b4)
     (succ-balls b4 b5)
     (succ-balls b5 b6)
     (succ-balls b6 b7)
     (succ-balls b7 b8)
     (succ-balls b8 b9)
     (succ-balls b9 b10)
     (succ-balls b10 b11)
     (succ-balls b11 b12)
     (succ-balls b12 b13)
     (succ-balls b13 b14)
     (succ-balls b14 b15)
     (succ-balls b15 b16)
     (succ-balls b16 b17)
     (succ-balls b17 b18)
     (succ-balls b18 b19)
     (succ-balls b19 b20)
     (succ-balls b20 b21)
     (succ-balls b21 b22)
     (succ-balls b22 b23)
     (succ-balls b23 b24)
     (succ-balls b24 b25)
     (succ-balls b25 b26)
     (succ-balls b26 b27)
     (succ-balls b27 b28)
     (succ-balls b28 b29)
     (succ-balls b29 b30)
     (succ-balls b30 b31)
     (succ-balls b31 b32)
     (succ-balls b32 b33)
     (succ-balls b33 b34)
     (succ-balls b34 b35)
     (succ-balls b35 b36)
     (succ-balls b36 b37)
     (succ-balls b37 b38)
     (succ-balls b38 b39)
     (succ-balls b39 b40)
     (succ-balls b40 b41)
     (succ-balls b41 b42)
     (succ-balls b42 b43)
     (succ-balls b43 b44)
     (succ-balls b44 b45)
     (succ-balls b45 b46)
     (succ-balls b46 b47)
     (succ-balls b47 b48)
     (succ-balls b48 b49)
     (succ-balls b49 b50)
     (succ-balls b50 b51)
     (succ-balls b51 b52)
     (succ-balls b52 b53)
     (succ-balls b53 b54)
     (succ-balls b54 b55)
     (succ-balls b55 b56)
     (succ-balls b56 b57)
     (succ-balls b57 b58)
     (succ-balls b58 b59)
     (succ-balls b59 b60)
     (succ-balls b60 b61)
     (succ-balls b61 b62)
     (succ-balls b62 b63)
     (succ-balls b63 b64)
     (succ-balls b64 b65)
     (succ-balls b65 b66)
     (succ-balls b66 b67)
     (succ-balls b67 b68)
     (succ-balls b68 b69)
     (succ-balls b69 b70)
     (succ-balls b70 b71)
     (succ-balls b71 b72)
     (succ-balls b72 b73)
     (succ-balls b73 b74)
     (succ-balls b74 b75)
     (succ-balls b75 b76)
     (succ-balls b76 b77)
     (succ-balls b77 b78)
     (succ-balls b78 b79)
     (succ-balls b79 b80)
     (succ-balls b80 b81)
     (succ-balls b81 b82)
     (succ-balls b82 b83)
     (succ-balls b83 b84)
     (succ-balls b84 b85)
     (succ-balls b85 b86)
     (succ-balls b86 b87)
     (succ-balls b87 b88)
     (succ-balls b88 b89)
     (succ-balls b89 b90)
     (succ-balls b90 b91)
     (succ-balls b91 b92)
     (succ-balls b92 b93)
     (succ-balls b93 b94)
     (succ-balls b94 b95)
     (succ-balls b95 b96)
     (succ-balls b96 b97)
     (succ-balls b97 b98)
     (succ-balls b98 b99)
     (succ-balls b99 b100)
     (succ-balls b100 b101)
     (succ-balls b101 b102)
     (succ-balls b102 b103)
     (succ-balls b103 b104)
     (succ-balls b104 b105)
     (succ-balls b105 b106)
     (succ-balls b106 b107)
     (succ-balls b107 b108)
     (succ-balls b108 b109)
     (succ-balls b109 b110)
     (succ-balls b110 b111)
     (succ-balls b111 b112)
     (succ-balls b112 b113)
     (succ-balls b113 b114)
     (succ-balls b114 b115)
     (succ-balls b115 b116)
     (succ-balls b116 b117)
     (succ-balls b117 b118)
     (succ-balls b118 b119)
     (succ-balls b119 b120)
     (succ-balls b120 b121)
     (succ-balls b121 b122)
     (succ-balls b122 b123)
     (succ-balls b123 b124)
     (succ-balls b124 b125)
     (succ-balls b125 b126)
     (succ-balls b126 b127)
     (succ-balls b127 b128)
     (succ-balls b128 b129)
     (succ-balls b129 b130)
     (succ-balls b130 b131)
     (succ-balls b131 b132)
     (succ-balls b132 b133)
     (succ-balls b133 b134)
     (succ-balls b134 b135)
     (succ-balls b135 b136)
     (succ-balls b136 b137)
     (succ-balls b137 b138)
     (succ-balls b138 b139)
     (succ-balls b139 b140)
     (succ-balls b140 b141)
     (succ-balls b141 b142)
     (succ-balls b142 b143)
     (succ-balls b143 b144)
     (succ-balls b144 b145)
     (succ-balls b145 b146)
     (succ-balls b146 b147)
     (succ-balls b147 b148)
     (succ-balls b148 b149)
     (succ-balls b149 b150)
     (succ-balls b150 b151)
     (succ-balls b151 b152)
     (succ-balls b152 b153)
     (succ-balls b153 b154)
     (succ-balls b154 b155)
     (succ-balls b155 b156)
     (succ-balls b156 b157)
     (succ-balls b157 b158)
     (succ-balls b158 b159)
     (succ-balls b159 b160)
     (succ-balls b160 b161)
     (succ-balls b161 b162)
     (succ-balls b162 b163)
     (succ-balls b163 b164)
     (succ-balls b164 b165)
     (succ-balls b165 b166)
     (succ-balls b166 b167)
     (succ-balls b167 b168)
     (succ-balls b168 b169)
     (succ-balls b169 b170)
     (succ-balls b170 b171)
     (succ-balls b171 b172)
     (succ-balls b172 b173)
     (succ-balls b173 b174)
     (succ-balls b174 b175)
     (succ-balls b175 b176)
     (succ-balls b176 b177)
     (succ-balls b177 b178)
     (succ-balls b178 b179)
     (succ-balls b179 b180)
     (succ-balls b180 b181)
     (succ-balls b181 b182)
     (succ-balls b182 b183)
     (succ-balls b183 b184)
     (succ-balls b184 b185)
     (succ-balls b185 b186)
     (succ-balls b186 b187)
     (succ-balls b187 b188)
     (succ-balls b188 b189)
     (succ-balls b189 b190)
     (succ-balls b190 b191)
     (succ-balls b191 b192)
     (succ-balls b192 b193)
     (succ-balls b193 b194)
     (succ-balls b194 b195)
     (succ-balls b195 b196)
     (succ-balls b196 b197)
     (succ-balls b197 b198)
     (succ-balls b198 b199)
     (succ-balls b199 b200)
     (succ-balls b200 b201)
     (succ-balls b201 b202)
     (succ-balls b202 b203)
     (succ-balls b203 b204)
     (succ-balls b204 b205)
     (succ-balls b205 b206)
     (succ-balls b206 b207)
     (succ-balls b207 b208)
     (succ-balls b208 b209)
     (succ-balls b209 b210)
     (succ-balls b210 b211)
     (succ-balls b211 b212)
     (succ-balls b212 b213)
     (succ-balls b213 b214)
     (succ-balls b214 b215)
     (succ-balls b215 b216)
     (succ-balls b216 b217)
     (succ-balls b217 b218)
     (succ-balls b218 b219)
     (succ-balls b219 b220)
     (succ-balls b220 b221)
     (succ-balls b221 b222)
     (succ-balls b222 b223)
     (succ-balls b223 b224)
     (succ-balls b224 b225)
     (succ-balls b225 b226)
     (succ-balls b226 b227)
     (succ-balls b227 b228)
     (succ-balls b228 b229)
     (succ-balls b229 b230)
     (succ-balls b230 b231)
     (succ-balls b231 b232)
     (succ-balls b232 b233)
     (succ-balls b233 b234)
     (succ-balls b234 b235)
     (succ-balls b235 b236)
     (succ-balls b236 b237)
     (succ-balls b237 b238)
     (succ-balls b238 b239)
     (succ-balls b239 b240)
     (succ-balls b240 b241)
     (succ-balls b241 b242)
     (succ-balls b242 b243)
     (succ-balls b243 b244)
     (succ-balls b244 b245)
     (succ-balls b245 b246)
     (succ-balls b246 b247)
     (succ-balls b247 b248)
     (succ-balls b248 b249)
     (succ-balls b249 b250)
     (succ-balls b250 b251)
     (succ-balls b251 b252)
     (succ-balls b252 b253)
     (succ-balls b253 b254)
     (succ-balls b254 b255)
     (succ-balls b255 b256)
     (succ-balls b256 b257)
     (succ-balls b257 b258)
     (succ-balls b258 b259)
     (succ-balls b259 b260)
     (succ-balls b260 b261)
     (succ-balls b261 b262)
     (succ-balls b262 b263)
     (succ-balls b263 b264)
     (succ-balls b264 b265)
     (succ-balls b265 b266)
     (succ-balls b266 b267)
     (succ-balls b267 b268)
     (succ-balls b268 b269)
     (succ-balls b269 b270)
     (succ-balls b270 b271)
     (succ-balls b271 b272)
     (succ-balls b272 b273)
     (succ-balls b273 b274)
     (succ-balls b274 b275)
     (succ-balls b275 b276)
     (succ-balls b276 b277)
     (succ-balls b277 b278)
     (succ-balls b278 b279)
     (succ-balls b279 b280)
     (succ-balls b280 b281)
     (succ-balls b281 b282)
     (succ-balls b282 b283)
     (succ-balls b283 b284)
     (succ-balls b284 b285)
     (succ-balls b285 b286)
     (succ-balls b286 b287)
     (succ-balls b287 b288)
     (succ-balls b288 b289)
     (succ-balls b289 b290)
     (succ-balls b290 b291)
     (succ-balls b291 b292)
     (succ-balls b292 b293)
     (succ-balls b293 b294)
     (succ-balls b294 b295)
     (succ-balls b295 b296)
     (succ-balls b296 b297)
     (succ-balls b297 b298)
     (succ-balls b298 b299)
     (succ-balls b299 b300)
     (succ-balls b300 b301)
     (succ-balls b301 b302)
     (succ-balls b302 b303)
     (succ-balls b303 b304)
     (succ-balls b304 b305)
     (succ-balls b305 b306)
     (succ-balls b306 b307)
     (succ-balls b307 b308)
     (succ-balls b308 b309)
     (succ-balls b309 b310)
     (succ-balls b310 b311)
     (succ-balls b311 b312)
     (succ-balls b312 b313)
     (succ-balls b313 b314)
     (succ-balls b314 b315)
     (succ-balls b315 b316)
     (succ-balls b316 b317)
     (succ-balls b317 b318)
     (succ-balls b318 b319)
     (succ-balls b319 b320)
     (succ-balls b320 b321)
     (succ-balls b321 b322)
     (succ-balls b322 b323)
     (succ-balls b323 b324)
     (succ-balls b324 b325)
     (succ-balls b325 b326)
     (succ-balls b326 b327)
     (succ-balls b327 b328)
     (succ-balls b328 b329)
     (succ-balls b329 b330)
     (succ-balls b330 b331)
     (succ-balls b331 b332)
     (succ-balls b332 b333)
     (succ-balls b333 b334)
     (succ-balls b334 b335)
     (succ-balls b335 b336)
     (succ-balls b336 b337)
     (succ-balls b337 b338)
     (succ-balls b338 b339)
     (succ-balls b339 b340)
     (succ-balls b340 b341)
     (succ-balls b341 b342)
     (succ-balls b342 b343)
     (succ-balls b343 b344)
     (succ-balls b344 b345)
     (succ-balls b345 b346)
     (succ-balls b346 b347)
     (succ-balls b347 b348)
     (succ-balls b348 b349)
     (succ-balls b349 b350)
     (succ-balls b350 b351)
     (succ-balls b351 b352)
     (succ-balls b352 b353)
     (succ-balls b353 b354)
     (succ-balls b354 b355)
     (succ-balls b355 b356)
     (succ-balls b356 b357)
     (succ-balls b357 b358)
     (succ-balls b358 b359)
     (succ-balls b359 b360)
     (succ-balls b360 b361)
     (succ-balls b361 b362)
     (succ-balls b362 b363)
     (succ-balls b363 b364)
     (succ-balls b364 b365)
     (succ-balls b365 b366)
     (succ-balls b366 b367)
     (succ-balls b367 b368)
     (succ-balls b368 b369)
     (succ-balls b369 b370)
     (succ-balls b370 b371)
     (succ-balls b371 b372)
     (succ-balls b372 b373)
     (succ-balls b373 b374)
     (succ-balls b374 b375)
     (succ-balls b375 b376)
     (succ-balls b376 b377)
     (succ-balls b377 b378)
     (succ-balls b378 b379)
     (succ-balls b379 b380)
     (succ-balls b380 b381)
     (succ-balls b381 b382)
     (succ-balls b382 b383)
     (succ-balls b383 b384)
     (succ-balls b384 b385)
     (succ-balls b385 b386)
     (succ-balls b386 b387)
     (succ-balls b387 b388)
     (succ-balls b388 b389)
     (succ-balls b389 b390)
     (succ-balls b390 b391)
     (succ-balls b391 b392)
     (succ-balls b392 b393)
     (succ-balls b393 b394)
     (succ-balls b394 b395)
     (succ-balls b395 b396)
     (succ-balls b396 b397)
     (succ-balls b397 b398)
     (succ-balls b398 b399)
     (succ-balls b399 b400)
     (succ-balls b400 b401)
     (succ-balls b401 b402)
     (succ-balls b402 b403)
     (succ-balls b403 b404)
     (succ-balls b404 b405)
     (succ-balls b405 b406)
     (succ-balls b406 b407)
     (succ-balls b407 b408)
     (succ-balls b408 b409)
     (succ-balls b409 b410)
     (succ-balls b410 b411)
     (succ-balls b411 b412)
     (succ-balls b412 b413)
     (succ-balls b413 b414)
     (succ-balls b414 b415)
     (succ-balls b415 b416)
     (succ-balls b416 b417)
     (succ-balls b417 b418)
     (succ-balls b418 b419)
     (succ-balls b419 b420)
     (succ-balls b420 b421)
     (succ-balls b421 b422)
     (succ-balls b422 b423)
     (succ-balls b423 b424)
     (succ-balls b424 b425)
     (succ-balls b425 b426)
     (succ-balls b426 b427)
     (succ-balls b427 b428)
     (succ-balls b428 b429)
     (succ-balls b429 b430)
     (succ-balls b430 b431)
     (succ-balls b431 b432)
     (succ-balls b432 b433)
     (succ-balls b433 b434)
     (succ-balls b434 b435)
     (succ-balls b435 b436)
     (succ-balls b436 b437)
     (succ-balls b437 b438)
     (succ-balls b438 b439)
     (succ-balls b439 b440)
     (succ-balls b440 b441)
     (succ-balls b441 b442)
     (succ-balls b442 b443)
     (succ-balls b443 b444)
     (succ-balls b444 b445)
     (succ-balls b445 b446)
     (succ-balls b446 b447)
     (succ-balls b447 b448)
     (succ-balls b448 b449)
     (succ-balls b449 b450)
     (succ-balls b450 b451)
     (succ-balls b451 b452)
     (succ-balls b452 b453)
     (succ-balls b453 b454)
     (succ-balls b454 b455)
     (succ-balls b455 b456)
     (succ-balls b456 b457)
     (succ-balls b457 b458)
     (succ-balls b458 b459)
     (succ-balls b459 b460)
     (succ-balls b460 b461)
     (succ-balls b461 b462)
     (succ-balls b462 b463)
     (succ-balls b463 b464)
     (succ-balls b464 b465)
     (succ-balls b465 b466)
     (succ-balls b466 b467)
     (succ-balls b467 b468)
     (succ-balls b468 b469)
     (succ-balls b469 b470)
     (succ-balls b470 b471)
     (succ-balls b471 b472)
     (succ-balls b472 b473)
     (succ-balls b473 b474)
     (succ-balls b474 b475)
     (succ-balls b475 b476)
     (succ-balls b476 b477)
     (succ-balls b477 b478)
     (succ-balls b478 b479)
     (succ-balls b479 b480)
     (succ-balls b480 b481)
     (succ-balls b481 b482)
     (succ-balls b482 b483)
     (succ-balls b483 b484)
     (succ-balls b484 b485)
     (succ-balls b485 b486)
     (succ-balls b486 b487)
     (succ-balls b487 b488)
     (succ-balls b488 b489)
     (succ-balls b489 b490)
     (succ-balls b490 b491)
     (succ-balls b491 b492)
     (succ-balls b492 b493)
     (succ-balls b493 b494)
     (succ-balls b494 b495)
     (succ-balls b495 b496)
     (succ-balls b496 b497)
     (succ-balls b497 b498)
     (succ-balls b498 b499)
     (succ-balls b499 b500)
     (at b1 roomA )
     (at b2 roomA )
     (at b3 roomA )
     (at b4 roomA )
     (at b5 roomA )
     (at b6 roomA )
     (at b7 roomA )
     (at b8 roomA )
     (at b9 roomA )
     (at b10 roomA )
     (at b11 roomA )
     (at b12 roomA )
     (at b13 roomA )
     (at b14 roomA )
     (at b15 roomA )
     (at b16 roomA )
     (at b17 roomA )
     (at b18 roomA )
     (at b19 roomA )
     (at b20 roomA )
     (at b21 roomA )
     (at b22 roomA )
     (at b23 roomA )
     (at b24 roomA )
     (at b25 roomA )
     (at b26 roomA )
     (at b27 roomA )
     (at b28 roomA )
     (at b29 roomA )
     (at b30 roomA )
     (at b31 roomA )
     (at b32 roomA )
     (at b33 roomA )
     (at b34 roomA )
     (at b35 roomA )
     (at b36 roomA )
     (at b37 roomA )
     (at b38 roomA )
     (at b39 roomA )
     (at b40 roomA )
     (at b41 roomA )
     (at b42 roomA )
     (at b43 roomA )
     (at b44 roomA )
     (at b45 roomA )
     (at b46 roomA )
     (at b47 roomA )
     (at b48 roomA )
     (at b49 roomA )
     (at b50 roomA )
     (at b51 roomA )
     (at b52 roomA )
     (at b53 roomA )
     (at b54 roomA )
     (at b55 roomA )
     (at b56 roomA )
     (at b57 roomA )
     (at b58 roomA )
     (at b59 roomA )
     (at b60 roomA )
     (at b61 roomA )
     (at b62 roomA )
     (at b63 roomA )
     (at b64 roomA )
     (at b65 roomA )
     (at b66 roomA )
     (at b67 roomA )
     (at b68 roomA )
     (at b69 roomA )
     (at b70 roomA )
     (at b71 roomA )
     (at b72 roomA )
     (at b73 roomA )
     (at b74 roomA )
     (at b75 roomA )
     (at b76 roomA )
     (at b77 roomA )
     (at b78 roomA )
     (at b79 roomA )
     (at b80 roomA )
     (at b81 roomA )
     (at b82 roomA )
     (at b83 roomA )
     (at b84 roomA )
     (at b85 roomA )
     (at b86 roomA )
     (at b87 roomA )
     (at b88 roomA )
     (at b89 roomA )
     (at b90 roomA )
     (at b91 roomA )
     (at b92 roomA )
     (at b93 roomA )
     (at b94 roomA )
     (at b95 roomA )
     (at b96 roomA )
     (at b97 roomA )
     (at b98 roomA )
     (at b99 roomA )
     (at b100 roomA )
     (at b101 roomA )
     (at b102 roomA )
     (at b103 roomA )
     (at b104 roomA )
     (at b105 roomA )
     (at b106 roomA )
     (at b107 roomA )
     (at b108 roomA )
     (at b109 roomA )
     (at b110 roomA )
     (at b111 roomA )
     (at b112 roomA )
     (at b113 roomA )
     (at b114 roomA )
     (at b115 roomA )
     (at b116 roomA )
     (at b117 roomA )
     (at b118 roomA )
     (at b119 roomA )
     (at b120 roomA )
     (at b121 roomA )
     (at b122 roomA )
     (at b123 roomA )
     (at b124 roomA )
     (at b125 roomA )
     (at b126 roomA )
     (at b127 roomA )
     (at b128 roomA )
     (at b129 roomA )
     (at b130 roomA )
     (at b131 roomA )
     (at b132 roomA )
     (at b133 roomA )
     (at b134 roomA )
     (at b135 roomA )
     (at b136 roomA )
     (at b137 roomA )
     (at b138 roomA )
     (at b139 roomA )
     (at b140 roomA )
     (at b141 roomA )
     (at b142 roomA )
     (at b143 roomA )
     (at b144 roomA )
     (at b145 roomA )
     (at b146 roomA )
     (at b147 roomA )
     (at b148 roomA )
     (at b149 roomA )
     (at b150 roomA )
     (at b151 roomA )
     (at b152 roomA )
     (at b153 roomA )
     (at b154 roomA )
     (at b155 roomA )
     (at b156 roomA )
     (at b157 roomA )
     (at b158 roomA )
     (at b159 roomA )
     (at b160 roomA )
     (at b161 roomA )
     (at b162 roomA )
     (at b163 roomA )
     (at b164 roomA )
     (at b165 roomA )
     (at b166 roomA )
     (at b167 roomA )
     (at b168 roomA )
     (at b169 roomA )
     (at b170 roomA )
     (at b171 roomA )
     (at b172 roomA )
     (at b173 roomA )
     (at b174 roomA )
     (at b175 roomA )
     (at b176 roomA )
     (at b177 roomA )
     (at b178 roomA )
     (at b179 roomA )
     (at b180 roomA )
     (at b181 roomA )
     (at b182 roomA )
     (at b183 roomA )
     (at b184 roomA )
     (at b185 roomA )
     (at b186 roomA )
     (at b187 roomA )
     (at b188 roomA )
     (at b189 roomA )
     (at b190 roomA )
     (at b191 roomA )
     (at b192 roomA )
     (at b193 roomA )
     (at b194 roomA )
     (at b195 roomA )
     (at b196 roomA )
     (at b197 roomA )
     (at b198 roomA )
     (at b199 roomA )
     (at b200 roomA )
     (at b201 roomA )
     (at b202 roomA )
     (at b203 roomA )
     (at b204 roomA )
     (at b205 roomA )
     (at b206 roomA )
     (at b207 roomA )
     (at b208 roomA )
     (at b209 roomA )
     (at b210 roomA )
     (at b211 roomA )
     (at b212 roomA )
     (at b213 roomA )
     (at b214 roomA )
     (at b215 roomA )
     (at b216 roomA )
     (at b217 roomA )
     (at b218 roomA )
     (at b219 roomA )
     (at b220 roomA )
     (at b221 roomA )
     (at b222 roomA )
     (at b223 roomA )
     (at b224 roomA )
     (at b225 roomA )
     (at b226 roomA )
     (at b227 roomA )
     (at b228 roomA )
     (at b229 roomA )
     (at b230 roomA )
     (at b231 roomA )
     (at b232 roomA )
     (at b233 roomA )
     (at b234 roomA )
     (at b235 roomA )
     (at b236 roomA )
     (at b237 roomA )
     (at b238 roomA )
     (at b239 roomA )
     (at b240 roomA )
     (at b241 roomA )
     (at b242 roomA )
     (at b243 roomA )
     (at b244 roomA )
     (at b245 roomA )
     (at b246 roomA )
     (at b247 roomA )
     (at b248 roomA )
     (at b249 roomA )
     (at b250 roomA )
     (at b251 roomA )
     (at b252 roomA )
     (at b253 roomA )
     (at b254 roomA )
     (at b255 roomA )
     (at b256 roomA )
     (at b257 roomA )
     (at b258 roomA )
     (at b259 roomA )
     (at b260 roomA )
     (at b261 roomA )
     (at b262 roomA )
     (at b263 roomA )
     (at b264 roomA )
     (at b265 roomA )
     (at b266 roomA )
     (at b267 roomA )
     (at b268 roomA )
     (at b269 roomA )
     (at b270 roomA )
     (at b271 roomA )
     (at b272 roomA )
     (at b273 roomA )
     (at b274 roomA )
     (at b275 roomA )
     (at b276 roomA )
     (at b277 roomA )
     (at b278 roomA )
     (at b279 roomA )
     (at b280 roomA )
     (at b281 roomA )
     (at b282 roomA )
     (at b283 roomA )
     (at b284 roomA )
     (at b285 roomA )
     (at b286 roomA )
     (at b287 roomA )
     (at b288 roomA )
     (at b289 roomA )
     (at b290 roomA )
     (at b291 roomA )
     (at b292 roomA )
     (at b293 roomA )
     (at b294 roomA )
     (at b295 roomA )
     (at b296 roomA )
     (at b297 roomA )
     (at b298 roomA )
     (at b299 roomA )
     (at b300 roomA )
     (at b301 roomA )
     (at b302 roomA )
     (at b303 roomA )
     (at b304 roomA )
     (at b305 roomA )
     (at b306 roomA )
     (at b307 roomA )
     (at b308 roomA )
     (at b309 roomA )
     (at b310 roomA )
     (at b311 roomA )
     (at b312 roomA )
     (at b313 roomA )
     (at b314 roomA )
     (at b315 roomA )
     (at b316 roomA )
     (at b317 roomA )
     (at b318 roomA )
     (at b319 roomA )
     (at b320 roomA )
     (at b321 roomA )
     (at b322 roomA )
     (at b323 roomA )
     (at b324 roomA )
     (at b325 roomA )
     (at b326 roomA )
     (at b327 roomA )
     (at b328 roomA )
     (at b329 roomA )
     (at b330 roomA )
     (at b331 roomA )
     (at b332 roomA )
     (at b333 roomA )
     (at b334 roomA )
     (at b335 roomA )
     (at b336 roomA )
     (at b337 roomA )
     (at b338 roomA )
     (at b339 roomA )
     (at b340 roomA )
     (at b341 roomA )
     (at b342 roomA )
     (at b343 roomA )
     (at b344 roomA )
     (at b345 roomA )
     (at b346 roomA )
     (at b347 roomA )
     (at b348 roomA )
     (at b349 roomA )
     (at b350 roomA )
     (at b351 roomA )
     (at b352 roomA )
     (at b353 roomA )
     (at b354 roomA )
     (at b355 roomA )
     (at b356 roomA )
     (at b357 roomA )
     (at b358 roomA )
     (at b359 roomA )
     (at b360 roomA )
     (at b361 roomA )
     (at b362 roomA )
     (at b363 roomA )
     (at b364 roomA )
     (at b365 roomA )
     (at b366 roomA )
     (at b367 roomA )
     (at b368 roomA )
     (at b369 roomA )
     (at b370 roomA )
     (at b371 roomA )
     (at b372 roomA )
     (at b373 roomA )
     (at b374 roomA )
     (at b375 roomA )
     (at b376 roomA )
     (at b377 roomA )
     (at b378 roomA )
     (at b379 roomA )
     (at b380 roomA )
     (at b381 roomA )
     (at b382 roomA )
     (at b383 roomA )
     (at b384 roomA )
     (at b385 roomA )
     (at b386 roomA )
     (at b387 roomA )
     (at b388 roomA )
     (at b389 roomA )
     (at b390 roomA )
     (at b391 roomA )
     (at b392 roomA )
     (at b393 roomA )
     (at b394 roomA )
     (at b395 roomA )
     (at b396 roomA )
     (at b397 roomA )
     (at b398 roomA )
     (at b399 roomA )
     (at b400 roomA )
     (at b401 roomA )
     (at b402 roomA )
     (at b403 roomA )
     (at b404 roomA )
     (at b405 roomA )
     (at b406 roomA )
     (at b407 roomA )
     (at b408 roomA )
     (at b409 roomA )
     (at b410 roomA )
     (at b411 roomA )
     (at b412 roomA )
     (at b413 roomA )
     (at b414 roomA )
     (at b415 roomA )
     (at b416 roomA )
     (at b417 roomA )
     (at b418 roomA )
     (at b419 roomA )
     (at b420 roomA )
     (at b421 roomA )
     (at b422 roomA )
     (at b423 roomA )
     (at b424 roomA )
     (at b425 roomA )
     (at b426 roomA )
     (at b427 roomA )
     (at b428 roomA )
     (at b429 roomA )
     (at b430 roomA )
     (at b431 roomA )
     (at b432 roomA )
     (at b433 roomA )
     (at b434 roomA )
     (at b435 roomA )
     (at b436 roomA )
     (at b437 roomA )
     (at b438 roomA )
     (at b439 roomA )
     (at b440 roomA )
     (at b441 roomA )
     (at b442 roomA )
     (at b443 roomA )
     (at b444 roomA )
     (at b445 roomA )
     (at b446 roomA )
     (at b447 roomA )
     (at b448 roomA )
     (at b449 roomA )
     (at b450 roomA )
     (at b451 roomA )
     (at b452 roomA )
     (at b453 roomA )
     (at b454 roomA )
     (at b455 roomA )
     (at b456 roomA )
     (at b457 roomA )
     (at b458 roomA )
     (at b459 roomA )
     (at b460 roomA )
     (at b461 roomA )
     (at b462 roomA )
     (at b463 roomA )
     (at b464 roomA )
     (at b465 roomA )
     (at b466 roomA )
     (at b467 roomA )
     (at b468 roomA )
     (at b469 roomA )
     (at b470 roomA )
     (at b471 roomA )
     (at b472 roomA )
     (at b473 roomA )
     (at b474 roomA )
     (at b475 roomA )
     (at b476 roomA )
     (at b477 roomA )
     (at b478 roomA )
     (at b479 roomA )
     (at b480 roomA )
     (at b481 roomA )
     (at b482 roomA )
     (at b483 roomA )
     (at b484 roomA )
     (at b485 roomA )
     (at b486 roomA )
     (at b487 roomA )
     (at b488 roomA )
     (at b489 roomA )
     (at b490 roomA )
     (at b491 roomA )
     (at b492 roomA )
     (at b493 roomA )
     (at b494 roomA )
     (at b495 roomA )
     (at b496 roomA )
     (at b497 roomA )
     (at b498 roomA )
     (at b499 roomA )
)
  (:goal (and 
      (at b1 roomB )
      (at b2 roomB )
      (at b3 roomB )
      (at b4 roomB )
      (at b5 roomB )
      (at b6 roomB )
      (at b7 roomB )
      (at b8 roomB )
      (at b9 roomB )
      (at b10 roomB )
      (at b11 roomB )
      (at b12 roomB )
      (at b13 roomB )
      (at b14 roomB )
      (at b15 roomB )
      (at b16 roomB )
      (at b17 roomB )
      (at b18 roomB )
      (at b19 roomB )
      (at b20 roomB )
      (at b21 roomB )
      (at b22 roomB )
      (at b23 roomB )
      (at b24 roomB )
      (at b25 roomB )
      (at b26 roomB )
      (at b27 roomB )
      (at b28 roomB )
      (at b29 roomB )
      (at b30 roomB )
      (at b31 roomB )
      (at b32 roomB )
      (at b33 roomB )
      (at b34 roomB )
      (at b35 roomB )
      (at b36 roomB )
      (at b37 roomB )
      (at b38 roomB )
      (at b39 roomB )
      (at b40 roomB )
      (at b41 roomB )
      (at b42 roomB )
      (at b43 roomB )
      (at b44 roomB )
      (at b45 roomB )
      (at b46 roomB )
      (at b47 roomB )
      (at b48 roomB )
      (at b49 roomB )
      (at b50 roomB )
      (at b51 roomB )
      (at b52 roomB )
      (at b53 roomB )
      (at b54 roomB )
      (at b55 roomB )
      (at b56 roomB )
      (at b57 roomB )
      (at b58 roomB )
      (at b59 roomB )
      (at b60 roomB )
      (at b61 roomB )
      (at b62 roomB )
      (at b63 roomB )
      (at b64 roomB )
      (at b65 roomB )
      (at b66 roomB )
      (at b67 roomB )
      (at b68 roomB )
      (at b69 roomB )
      (at b70 roomB )
      (at b71 roomB )
      (at b72 roomB )
      (at b73 roomB )
      (at b74 roomB )
      (at b75 roomB )
      (at b76 roomB )
      (at b77 roomB )
      (at b78 roomB )
      (at b79 roomB )
      (at b80 roomB )
      (at b81 roomB )
      (at b82 roomB )
      (at b83 roomB )
      (at b84 roomB )
      (at b85 roomB )
      (at b86 roomB )
      (at b87 roomB )
      (at b88 roomB )
      (at b89 roomB )
      (at b90 roomB )
      (at b91 roomB )
      (at b92 roomB )
      (at b93 roomB )
      (at b94 roomB )
      (at b95 roomB )
      (at b96 roomB )
      (at b97 roomB )
      (at b98 roomB )
      (at b99 roomB )
      (at b100 roomB )
      (at b101 roomB )
      (at b102 roomB )
      (at b103 roomB )
      (at b104 roomB )
      (at b105 roomB )
      (at b106 roomB )
      (at b107 roomB )
      (at b108 roomB )
      (at b109 roomB )
      (at b110 roomB )
      (at b111 roomB )
      (at b112 roomB )
      (at b113 roomB )
      (at b114 roomB )
      (at b115 roomB )
      (at b116 roomB )
      (at b117 roomB )
      (at b118 roomB )
      (at b119 roomB )
      (at b120 roomB )
      (at b121 roomB )
      (at b122 roomB )
      (at b123 roomB )
      (at b124 roomB )
      (at b125 roomB )
      (at b126 roomB )
      (at b127 roomB )
      (at b128 roomB )
      (at b129 roomB )
      (at b130 roomB )
      (at b131 roomB )
      (at b132 roomB )
      (at b133 roomB )
      (at b134 roomB )
      (at b135 roomB )
      (at b136 roomB )
      (at b137 roomB )
      (at b138 roomB )
      (at b139 roomB )
      (at b140 roomB )
      (at b141 roomB )
      (at b142 roomB )
      (at b143 roomB )
      (at b144 roomB )
      (at b145 roomB )
      (at b146 roomB )
      (at b147 roomB )
      (at b148 roomB )
      (at b149 roomB )
      (at b150 roomB )
      (at b151 roomB )
      (at b152 roomB )
      (at b153 roomB )
      (at b154 roomB )
      (at b155 roomB )
      (at b156 roomB )
      (at b157 roomB )
      (at b158 roomB )
      (at b159 roomB )
      (at b160 roomB )
      (at b161 roomB )
      (at b162 roomB )
      (at b163 roomB )
      (at b164 roomB )
      (at b165 roomB )
      (at b166 roomB )
      (at b167 roomB )
      (at b168 roomB )
      (at b169 roomB )
      (at b170 roomB )
      (at b171 roomB )
      (at b172 roomB )
      (at b173 roomB )
      (at b174 roomB )
      (at b175 roomB )
      (at b176 roomB )
      (at b177 roomB )
      (at b178 roomB )
      (at b179 roomB )
      (at b180 roomB )
      (at b181 roomB )
      (at b182 roomB )
      (at b183 roomB )
      (at b184 roomB )
      (at b185 roomB )
      (at b186 roomB )
      (at b187 roomB )
      (at b188 roomB )
      (at b189 roomB )
      (at b190 roomB )
      (at b191 roomB )
      (at b192 roomB )
      (at b193 roomB )
      (at b194 roomB )
      (at b195 roomB )
      (at b196 roomB )
      (at b197 roomB )
      (at b198 roomB )
      (at b199 roomB )
      (at b200 roomB )
      (at b201 roomB )
      (at b202 roomB )
      (at b203 roomB )
      (at b204 roomB )
      (at b205 roomB )
      (at b206 roomB )
      (at b207 roomB )
      (at b208 roomB )
      (at b209 roomB )
      (at b210 roomB )
      (at b211 roomB )
      (at b212 roomB )
      (at b213 roomB )
      (at b214 roomB )
      (at b215 roomB )
      (at b216 roomB )
      (at b217 roomB )
      (at b218 roomB )
      (at b219 roomB )
      (at b220 roomB )
      (at b221 roomB )
      (at b222 roomB )
      (at b223 roomB )
      (at b224 roomB )
      (at b225 roomB )
      (at b226 roomB )
      (at b227 roomB )
      (at b228 roomB )
      (at b229 roomB )
      (at b230 roomB )
      (at b231 roomB )
      (at b232 roomB )
      (at b233 roomB )
      (at b234 roomB )
      (at b235 roomB )
      (at b236 roomB )
      (at b237 roomB )
      (at b238 roomB )
      (at b239 roomB )
      (at b240 roomB )
      (at b241 roomB )
      (at b242 roomB )
      (at b243 roomB )
      (at b244 roomB )
      (at b245 roomB )
      (at b246 roomB )
      (at b247 roomB )
      (at b248 roomB )
      (at b249 roomB )
      (at b250 roomB )
      (at b251 roomB )
      (at b252 roomB )
      (at b253 roomB )
      (at b254 roomB )
      (at b255 roomB )
      (at b256 roomB )
      (at b257 roomB )
      (at b258 roomB )
      (at b259 roomB )
      (at b260 roomB )
      (at b261 roomB )
      (at b262 roomB )
      (at b263 roomB )
      (at b264 roomB )
      (at b265 roomB )
      (at b266 roomB )
      (at b267 roomB )
      (at b268 roomB )
      (at b269 roomB )
      (at b270 roomB )
      (at b271 roomB )
      (at b272 roomB )
      (at b273 roomB )
      (at b274 roomB )
      (at b275 roomB )
      (at b276 roomB )
      (at b277 roomB )
      (at b278 roomB )
      (at b279 roomB )
      (at b280 roomB )
      (at b281 roomB )
      (at b282 roomB )
      (at b283 roomB )
      (at b284 roomB )
      (at b285 roomB )
      (at b286 roomB )
      (at b287 roomB )
      (at b288 roomB )
      (at b289 roomB )
      (at b290 roomB )
      (at b291 roomB )
      (at b292 roomB )
      (at b293 roomB )
      (at b294 roomB )
      (at b295 roomB )
      (at b296 roomB )
      (at b297 roomB )
      (at b298 roomB )
      (at b299 roomB )
      (at b300 roomB )
      (at b301 roomB )
      (at b302 roomB )
      (at b303 roomB )
      (at b304 roomB )
      (at b305 roomB )
      (at b306 roomB )
      (at b307 roomB )
      (at b308 roomB )
      (at b309 roomB )
      (at b310 roomB )
      (at b311 roomB )
      (at b312 roomB )
      (at b313 roomB )
      (at b314 roomB )
      (at b315 roomB )
      (at b316 roomB )
      (at b317 roomB )
      (at b318 roomB )
      (at b319 roomB )
      (at b320 roomB )
      (at b321 roomB )
      (at b322 roomB )
      (at b323 roomB )
      (at b324 roomB )
      (at b325 roomB )
      (at b326 roomB )
      (at b327 roomB )
      (at b328 roomB )
      (at b329 roomB )
      (at b330 roomB )
      (at b331 roomB )
      (at b332 roomB )
      (at b333 roomB )
      (at b334 roomB )
      (at b335 roomB )
      (at b336 roomB )
      (at b337 roomB )
      (at b338 roomB )
      (at b339 roomB )
      (at b340 roomB )
      (at b341 roomB )
      (at b342 roomB )
      (at b343 roomB )
      (at b344 roomB )
      (at b345 roomB )
      (at b346 roomB )
      (at b347 roomB )
      (at b348 roomB )
      (at b349 roomB )
      (at b350 roomB )
      (at b351 roomB )
      (at b352 roomB )
      (at b353 roomB )
      (at b354 roomB )
      (at b355 roomB )
      (at b356 roomB )
      (at b357 roomB )
      (at b358 roomB )
      (at b359 roomB )
      (at b360 roomB )
      (at b361 roomB )
      (at b362 roomB )
      (at b363 roomB )
      (at b364 roomB )
      (at b365 roomB )
      (at b366 roomB )
      (at b367 roomB )
      (at b368 roomB )
      (at b369 roomB )
      (at b370 roomB )
      (at b371 roomB )
      (at b372 roomB )
      (at b373 roomB )
      (at b374 roomB )
      (at b375 roomB )
      (at b376 roomB )
      (at b377 roomB )
      (at b378 roomB )
      (at b379 roomB )
      (at b380 roomB )
      (at b381 roomB )
      (at b382 roomB )
      (at b383 roomB )
      (at b384 roomB )
      (at b385 roomB )
      (at b386 roomB )
      (at b387 roomB )
      (at b388 roomB )
      (at b389 roomB )
      (at b390 roomB )
      (at b391 roomB )
      (at b392 roomB )
      (at b393 roomB )
      (at b394 roomB )
      (at b395 roomB )
      (at b396 roomB )
      (at b397 roomB )
      (at b398 roomB )
      (at b399 roomB )
      (at b400 roomB )
      (at b401 roomB )
      (at b402 roomB )
      (at b403 roomB )
      (at b404 roomB )
      (at b405 roomB )
      (at b406 roomB )
      (at b407 roomB )
      (at b408 roomB )
      (at b409 roomB )
      (at b410 roomB )
      (at b411 roomB )
      (at b412 roomB )
      (at b413 roomB )
      (at b414 roomB )
      (at b415 roomB )
      (at b416 roomB )
      (at b417 roomB )
      (at b418 roomB )
      (at b419 roomB )
      (at b420 roomB )
      (at b421 roomB )
      (at b422 roomB )
      (at b423 roomB )
      (at b424 roomB )
      (at b425 roomB )
      (at b426 roomB )
      (at b427 roomB )
      (at b428 roomB )
      (at b429 roomB )
      (at b430 roomB )
      (at b431 roomB )
      (at b432 roomB )
      (at b433 roomB )
      (at b434 roomB )
      (at b435 roomB )
      (at b436 roomB )
      (at b437 roomB )
      (at b438 roomB )
      (at b439 roomB )
      (at b440 roomB )
      (at b441 roomB )
      (at b442 roomB )
      (at b443 roomB )
      (at b444 roomB )
      (at b445 roomB )
      (at b446 roomB )
      (at b447 roomB )
      (at b448 roomB )
      (at b449 roomB )
      (at b450 roomB )
      (at b451 roomB )
      (at b452 roomB )
      (at b453 roomB )
      (at b454 roomB )
      (at b455 roomB )
      (at b456 roomB )
      (at b457 roomB )
      (at b458 roomB )
      (at b459 roomB )
      (at b460 roomB )
      (at b461 roomB )
      (at b462 roomB )
      (at b463 roomB )
      (at b464 roomB )
      (at b465 roomB )
      (at b466 roomB )
      (at b467 roomB )
      (at b468 roomB )
      (at b469 roomB )
      (at b470 roomB )
      (at b471 roomB )
      (at b472 roomB )
      (at b473 roomB )
      (at b474 roomB )
      (at b475 roomB )
      (at b476 roomB )
      (at b477 roomB )
      (at b478 roomB )
      (at b479 roomB )
      (at b480 roomB )
      (at b481 roomB )
      (at b482 roomB )
      (at b483 roomB )
      (at b484 roomB )
      (at b485 roomB )
      (at b486 roomB )
      (at b487 roomB )
      (at b488 roomB )
      (at b489 roomB )
      (at b490 roomB )
      (at b491 roomB )
      (at b492 roomB )
      (at b493 roomB )
      (at b494 roomB )
      (at b495 roomB )
      (at b496 roomB )
      (at b497 roomB )
      (at b498 roomB )
      (at b499 roomB )
)))
