;; TipJar - Creator Tipping Platform (Clarity v4)

(define-map balances
    principal
    uint
)

(define-map tips
    {creator: principal, index: uint}
    {
        from: principal,
        amount: uint,
        message: (string-utf8 256),
        block-height: uint
    }
)

(define-map tip-count
    principal
    uint
)

(define-public (send-tip (creator principal) (message (string-utf8 256)) (amount uint))
    (let
        (
            (current-balance (default-to u0 (map-get? balances creator)))
            (current-count (default-to u0 (map-get? tip-count creator)))
        )
        (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
        
        (map-set balances creator (+ current-balance amount))
        (map-set tips {creator: creator, index: current-count} {
            from: tx-sender,
            amount: amount,
            message: message,
            block-height: block-height
        })
        (map-set tip-count creator (+ current-count u1))
        
        (ok true)
    )
)

(define-public (withdraw)
    (let
        (
            (amount (default-to u0 (map-get? balances tx-sender)))
        )
        (asserts! (> amount u0) (err u100))
        (try! (as-contract (stx-transfer? amount tx-sender tx-sender)))
        (map-set balances tx-sender u0)
        (ok amount)
    )
)

(define-read-only (get-balance (creator principal))
    (ok (default-to u0 (map-get? balances creator)))
)
