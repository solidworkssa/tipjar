;; TipJar Clarity Contract
;; Direct tipping and micropayments for creators.


(define-map total-received principal uint)

(define-public (tip (recipient principal) (amount uint) (message (string-utf8 256)))
    (begin
        (try! (stx-transfer? amount tx-sender recipient))
        (map-set total-received recipient 
            (+ (default-to u0 (map-get? total-received recipient)) amount))
        (print {event: "tip_received", from: tx-sender, to: recipient, amount: amount, message: message})
        (ok true)
    )
)

(define-read-only (get-total-received (recipient principal))
    (ok (default-to u0 (map-get? total-received recipient)))
)

