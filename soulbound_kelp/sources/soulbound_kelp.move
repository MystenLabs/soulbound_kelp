/// Module: soulbound_kelp
module soulbound_kelp::soulbound_kelp {

    public struct SoulboundKelp has key { 
        id: UID,
        minter_address: address,
    }

    public entry fun mint(
        to: address,
        ctx: &mut TxContext
    ) {
        transfer::transfer(
            SoulboundKelp{
                id: object::new(ctx),
                minter_address: ctx.sender()
            },
            to
        );
    }

    public fun burn(
        soulbound_kelp: SoulboundKelp
    ) {
        let SoulboundKelp{
            id,
            minter_address: _,
        } = soulbound_kelp;
         id.delete();
    }
}
