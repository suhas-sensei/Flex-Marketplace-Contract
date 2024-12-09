use starknet::ContractAddress;

use erc_1523_insurance_policies::types::{Policy, State, Property};

#[starknet::interface]
pub trait IERC1523PolicyMetadata<TState> {
    fn policyMetadata(self: @TState, tokenId: u256, property: Property) -> ByteArray;
}


#[starknet::interface]
pub trait IERC1523<TState> {
    fn create_policy(ref self: TState, policy: Policy) -> u256;
    fn update_policy_state(ref self: TState, token_id: u256, state: State);

    fn get_policy(self: @TState, token_id: u256) -> Policy;
    fn get_all_user_policies(self: @TState, user: ContractAddress) -> Array<Policy>;
    fn get_user_policy_amount(self: @TState, user: ContractAddress) -> u64;
}
