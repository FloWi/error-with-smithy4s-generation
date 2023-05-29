$version: "2.0"

namespace openapi

use alloy#dataExamples
use alloy.openapi#openapiExtensions
use error#NegotiateContractInputBody
use error#RegisterInputBodyFaction
use smithytranslate#contentType

@auth([
    httpBearerAuth
])
@httpBearerAuth
service OpenapiService {
    operations: [
        AcceptContract
        CreateChart
        CreateShipShipScan
        CreateShipSystemScan
        CreateShipWaypointScan
        CreateSurvey
        DeliverContract
        DockShip
        ExtractResources
        FulfillContract
        GetContract
        GetContracts
        GetFaction
        GetFactions
        GetJumpGate
        GetMarket
        GetMyAgent
        GetMyShip
        GetMyShipCargo
        GetMyShips
        GetShipCooldown
        GetShipNav
        GetShipyard
        GetStatus
        GetSystem
        GetSystems
        GetSystemWaypoints
        GetWaypoint
        Jettison
        JumpShip
        NavigateShip
        NegotiateContract
        OrbitShip
        PatchShipNav
        PurchaseCargo
        PurchaseShip
        RefuelShip
        Register
        SellCargo
        ShipRefine
        TransferCargo
        WarpShip
    ]
}

/// Accept a contract.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/contracts/{contractId}/accept"
    code: 200
)
operation AcceptContract {
    input: AcceptContractInput
    output: AcceptContract200
}

/// Command a ship to chart the current waypoint.
///
/// Waypoints in the universe are uncharted by default. These locations will not show up in the API until they have been charted by a ship.
///
/// Charting a location will record your agent as the one who created the chart.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/chart"
    code: 201
)
operation CreateChart {
    input: CreateChartInput
    output: CreateChart201
}

/// Activate your ship's sensor arrays to scan for ship information.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/scan/ships"
    code: 201
)
operation CreateShipShipScan {
    input: CreateShipShipScanInput
    output: CreateShipShipScan201
}

/// Activate your ship's sensor arrays to scan for system information.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/scan/systems"
    code: 201
)
operation CreateShipSystemScan {
    input: CreateShipSystemScanInput
    output: CreateShipSystemScan201
}

/// Activate your ship's sensor arrays to scan for waypoint information.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/scan/waypoints"
    code: 201
)
operation CreateShipWaypointScan {
    input: CreateShipWaypointScanInput
    output: CreateShipWaypointScan201
}

/// If you want to target specific yields for an extraction, you can survey a waypoint, such as an asteroid field, and send the survey in the body of the extract request. Each survey may have multiple deposits, and if a symbol shows up more than once, that indicates a higher chance of extracting that resource.
///
/// Your ship will enter a cooldown between consecutive survey requests. Surveys will eventually expire after a period of time. Multiple ships can use the same survey for extraction.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/survey"
    code: 201
)
operation CreateSurvey {
    input: CreateSurveyInput
    output: CreateSurvey201
}

/// Deliver cargo on a given contract.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/contracts/{contractId}/deliver"
    code: 200
)
operation DeliverContract {
    input: DeliverContractInput
    output: DeliverContract200
}

/// Attempt to dock your ship at it's current location. Docking will only succeed if the waypoint is a dockable location, and your ship is capable of docking at the time of the request.
///
/// The endpoint is idempotent - successive calls will succeed even if the ship is already docked.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/dock"
    code: 200
)
operation DockShip {
    input: DockShipInput
    output: DockShip200
}

/// Extract resources from the waypoint into your ship. Send an optional survey as the payload to target specific yields.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/extract"
    code: 201
)
operation ExtractResources {
    input: ExtractResourcesInput
    output: ExtractResources201
}

/// Fulfill a contract
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/contracts/{contractId}/fulfill"
    code: 200
)
operation FulfillContract {
    input: FulfillContractInput
    output: FulfillContract200
}

/// Get the details of a contract by ID.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/contracts/{contractId}"
    code: 200
)
operation GetContract {
    input: GetContractInput
    output: GetContract200
}

/// List all of your contracts.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/contracts"
    code: 200
)
operation GetContracts {
    input: GetContractsInput
    output: GetContracts200
}

/// View the details of a faction.
@http(
    method: "GET"
    uri: "/factions/{factionSymbol}"
    code: 200
)
operation GetFaction {
    input: GetFactionInput
    output: GetFaction200
}

/// List all discovered factions in the game.
@http(
    method: "GET"
    uri: "/factions"
    code: 200
)
operation GetFactions {
    input: GetFactionsInput
    output: GetFactions200
}

/// Get jump gate details for a waypoint.
@http(
    method: "GET"
    uri: "/systems/{systemSymbol}/waypoints/{waypointSymbol}/jump-gate"
    code: 200
)
operation GetJumpGate {
    input: GetJumpGateInput
    output: GetJumpGate200
}

/// Retrieve imports, exports and exchange data from a marketplace. Imports can be sold, exports can be purchased, and exchange goods can be purchased or sold. Send a ship to the waypoint to access trade good prices and recent transactions.
@http(
    method: "GET"
    uri: "/systems/{systemSymbol}/waypoints/{waypointSymbol}/market"
    code: 200
)
operation GetMarket {
    input: GetMarketInput
    output: GetMarket200
}

/// Fetch your agent's details.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/agent"
    code: 200
)
operation GetMyAgent {
    input: Unit
    output: GetMyAgent200
}

/// Retrieve the details of your ship.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/ships/{shipSymbol}"
    code: 200
)
operation GetMyShip {
    input: GetMyShipInput
    output: GetMyShip200
}

/// Retrieve the cargo of your ship.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/ships/{shipSymbol}/cargo"
    code: 200
)
operation GetMyShipCargo {
    input: GetMyShipCargoInput
    output: GetMyShipCargo200
}

/// Retrieve all of your ships.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/ships"
    code: 200
)
operation GetMyShips {
    input: GetMyShipsInput
    output: GetMyShips200
}

/// Retrieve the details of your ship's reactor cooldown. Some actions such as activating your jump drive, scanning, or extracting resources taxes your reactor and results in a cooldown.
///
/// Your ship cannot perform additional actions until your cooldown has expired. The duration of your cooldown is relative to the power consumption of the related modules or mounts for the action taken.
///
/// Response returns a 204 status code (no-content) when the ship has no cooldown.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/ships/{shipSymbol}/cooldown"
    code: 200
)
operation GetShipCooldown {
    input: GetShipCooldownInput
    output: GetShipCooldown200
}

/// Get the current nav status of a ship.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/my/ships/{shipSymbol}/nav"
    code: 200
)
operation GetShipNav {
    input: GetShipNavInput
    output: GetShipNav200
}

/// Get the shipyard for a waypoint. Send a ship to the waypoint to access ships that are currently available for purchase and recent transactions.
@http(
    method: "GET"
    uri: "/systems/{systemSymbol}/waypoints/{waypointSymbol}/shipyard"
    code: 200
)
operation GetShipyard {
    input: GetShipyardInput
    output: GetShipyard200
}

/// Return the status of the game server.
@http(
    method: "GET"
    uri: "/"
    code: 200
)
operation GetStatus {
    input: Unit
    output: GetStatus200
}

/// Get the details of a system.
@http(
    method: "GET"
    uri: "/systems/{systemSymbol}"
    code: 200
)
operation GetSystem {
    input: GetSystemInput
    output: GetSystem200
}

/// Return a list of all systems.
@http(
    method: "GET"
    uri: "/systems"
    code: 200
)
operation GetSystems {
    input: GetSystemsInput
    output: GetSystems200
}

/// Fetch all of the waypoints for a given system. System must be charted or a ship must be present to return waypoint details.
@auth([
    httpBearerAuth
])
@http(
    method: "GET"
    uri: "/systems/{systemSymbol}/waypoints"
    code: 200
)
operation GetSystemWaypoints {
    input: GetSystemWaypointsInput
    output: GetSystemWaypoints200
}

/// View the details of a waypoint.
@http(
    method: "GET"
    uri: "/systems/{systemSymbol}/waypoints/{waypointSymbol}"
    code: 200
)
operation GetWaypoint {
    input: GetWaypointInput
    output: GetWaypoint200
}

/// Jettison cargo from your ship's cargo hold.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/jettison"
    code: 200
)
operation Jettison {
    input: JettisonInput
    output: Jettison200
}

/// Jump your ship instantly to a target system. When used while in orbit or docked to a jump gate waypoint, any ship can use this command. When used elsewhere, jumping requires a jump drive unit and consumes a unit of antimatter (which needs to be in your cargo).
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/jump"
    code: 200
)
operation JumpShip {
    input: JumpShipInput
    output: JumpShip200
}

/// Navigate to a target destination. The destination must be located within the same system as the ship. Navigating will consume the necessary fuel and supplies from the ship's manifest, and will pay out crew wages from the agent's account.
///
/// The returned response will detail the route information including the expected time of arrival. Most ship actions are unavailable until the ship has arrived at it's destination.
///
/// To travel between systems, see the ship's warp or jump actions.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/navigate"
    code: 200
)
operation NavigateShip {
    input: NavigateShipInput
    output: NavigateShip200
}

///
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/negotiate/contract"
    code: 201
)
operation NegotiateContract {
    input: NegotiateContractInput
    output: NegotiateContract201
}

/// Attempt to move your ship into orbit at it's current location. The request will only succeed if your ship is capable of moving into orbit at the time of the request.
///
/// The endpoint is idempotent - successive calls will succeed even if the ship is already in orbit.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/orbit"
    code: 200
)
operation OrbitShip {
    input: OrbitShipInput
    output: OrbitShip200
}

/// Update the nav data of a ship, such as the flight mode.
@auth([
    httpBearerAuth
])
@http(
    method: "PATCH"
    uri: "/my/ships/{shipSymbol}/nav"
    code: 200
)
operation PatchShipNav {
    input: PatchShipNavInput
    output: PatchShipNav200
}

/// Purchase cargo.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/purchase"
    code: 201
)
operation PurchaseCargo {
    input: PurchaseCargoInput
    output: PurchaseCargo201
}

/// Purchase a ship
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships"
    code: 201
)
operation PurchaseShip {
    input: PurchaseShipInput
    output: PurchaseShip201
}

/// Refuel your ship from the local market.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/refuel"
    code: 200
)
operation RefuelShip {
    input: RefuelShipInput
    output: RefuelShip200
}

/// Creates a new agent and ties it to a temporary Account.
///
/// The agent symbol is a 3-14 character string that will represent your agent. This symbol will prefix the symbol of every ship you own. Agent symbols will be cast to all uppercase characters.
///
/// A new agent will be granted an authorization token, a contract with their starting faction, a command ship with a jump drive, and one hundred thousand credits.
///
/// > #### Keep your token safe and secure
/// >
/// > Save your token during the alpha phase. There is no way to regenerate this token without starting a new agent. In the future you will be able to generate and manage your tokens from the SpaceTraders website.
///
/// You can accept your contract using the `/my/contracts/{contractId}/accept` endpoint. You will want to navigate your command ship to a nearby asteroid field and execute the `/my/ships/{shipSymbol}/extract` endpoint to mine various types of ores and minerals.
///
/// Return to the contract destination and execute the `/my/ships/{shipSymbol}/deliver` endpoint to deposit goods into the contract.
///
/// When your contract is fulfilled, you can call `/my/contracts/{contractId}/fulfill` to retrieve payment.
@http(
    method: "POST"
    uri: "/register"
    code: 201
)
operation Register {
    input: RegisterInput
    output: Register201
}

/// Sell cargo.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/sell"
    code: 201
)
operation SellCargo {
    input: SellCargoInput
    output: SellCargo201
}

/// Attempt to refine the raw materials on your ship. The request will only succeed if your ship is capable of refining at the time of the request.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/refine"
    code: 200
)
operation ShipRefine {
    input: ShipRefineInput
    output: ShipRefine200
}

/// Transfer cargo between ships.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/transfer"
    code: 200
)
operation TransferCargo {
    input: TransferCargoInput
    output: TransferCargo200
}

/// Warp your ship to a target destination in another system. Warping will consume the necessary fuel and supplies from the ship's manifest, and will pay out crew wages from the agent's account.
///
/// The returned response will detail the route information including the expected time of arrival. Most ship actions are unavailable until the ship has arrived at it's destination.
@auth([
    httpBearerAuth
])
@http(
    method: "POST"
    uri: "/my/ships/{shipSymbol}/warp"
    code: 200
)
operation WarpShip {
    input: WarpShipInput
    output: WarpShip200
}

structure AcceptContract200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: AcceptContract200Body
}

structure AcceptContract200Body {
    @required
    data: AcceptContract200BodyData
}

structure AcceptContract200BodyData {
    @required
    agent: Agent
    @required
    contract: Contract
}

structure AcceptContractInput {
    @httpLabel
    @required
    contractId: String
}

///
structure Agent {
    @length(
        min: 1
    )
    @required
    accountId: String
    @length(
        min: 1
    )
    @required
    symbol: String
    /// The headquarters of the agent.
    @length(
        min: 1
    )
    @required
    headquarters: String
    /// The number of credits the agent has available. Credits can be negative if funds have been overdrawn.
    @required
    credits: Integer
    /// The faction the agent started with.
    @length(
        min: 1
    )
    @required
    startingFaction: String
}

/// The chart of a system or waypoint, which makes the location visible to other agents.
structure Chart {
    waypointSymbol: String
    submittedBy: String
    @timestampFormat("date-time")
    submittedOn: Timestamp
}

///
structure ConnectedSystem {
    @length(
        min: 1
    )
    @required
    symbol: String
    @length(
        min: 1
    )
    @required
    sectorSymbol: String
    @required
    type: SystemType
    /// The symbol of the faction that owns the connected jump gate in the system.
    factionSymbol: String
    @required
    x: Integer
    @required
    y: Integer
    @required
    distance: Integer
}

///
structure Contract {
    @length(
        min: 1
    )
    @required
    id: String
    /// The symbol of the faction that this contract is for.
    @length(
        min: 1
    )
    @required
    factionSymbol: String
    @required
    type: ContractType
    @required
    terms: ContractTerms
    /// Whether the contract has been accepted by the agent
    @required
    accepted: Boolean
    /// Whether the contract has been fulfilled
    @required
    fulfilled: Boolean
    /// Deprecated in favor of deadlineToAccept
    @required
    @timestampFormat("date-time")
    expiration: Timestamp
    /// The time at which the contract is no longer available to be accepted
    @timestampFormat("date-time")
    deadlineToAccept: Timestamp
}

/// The details of a delivery contract. Includes the type of good, units needed, and the destination.
structure ContractDeliverGood {
    /// The symbol of the trade good to deliver.
    @length(
        min: 1
    )
    @required
    tradeSymbol: String
    /// The destination where goods need to be delivered.
    @length(
        min: 1
    )
    @required
    destinationSymbol: String
    /// The number of units that need to be delivered on this contract.
    @required
    unitsRequired: Integer
    /// The number of units fulfilled on this contract.
    @required
    unitsFulfilled: Integer
}

structure ContractPayment {
    /// The amount of credits received up front for accepting the contract.
    @required
    onAccepted: Integer
    /// The amount of credits received when the contract is fulfilled.
    @required
    onFulfilled: Integer
}

structure ContractTerms {
    /// The deadline for the contract.
    @required
    @timestampFormat("date-time")
    deadline: Timestamp
    @required
    payment: ContractPayment
    deliver: Deliver
}

/// A cooldown is a period of time in which a ship cannot perform certain actions.
structure Cooldown {
    /// The symbol of the ship that is on cooldown
    @length(
        min: 1
    )
    @required
    shipSymbol: String
    /// The total duration of the cooldown in seconds
    @range(
        min: 0
    )
    @required
    totalSeconds: Integer
    /// The remaining duration of the cooldown in seconds
    @range(
        min: 0
    )
    @required
    remainingSeconds: Integer
    /// The date and time when the cooldown expires in ISO 8601 format
    @timestampFormat("date-time")
    expiration: Timestamp
}

structure CreateChart201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: CreateChart201Body
}

structure CreateChart201Body {
    @required
    data: CreateChart201BodyData
}

structure CreateChart201BodyData {
    @required
    chart: Chart
    @required
    waypoint: Waypoint
}

structure CreateChartInput {
    /// The symbol of the ship
    @httpLabel
    @required
    shipSymbol: String
}

structure CreateShipShipScan201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: CreateShipShipScan201Body
}

///
structure CreateShipShipScan201Body {
    @required
    data: CreateShipShipScan201BodyData
}

structure CreateShipShipScan201BodyData {
    @required
    cooldown: Cooldown
    @required
    ships: CreateShipShipScan201BodyDataShips
}

structure CreateShipShipScanInput {
    @httpLabel
    @required
    shipSymbol: String
}

structure CreateShipSystemScan201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: CreateShipSystemScan201Body
}

///
structure CreateShipSystemScan201Body {
    @required
    data: CreateShipSystemScan201BodyData
}

structure CreateShipSystemScan201BodyData {
    @required
    cooldown: Cooldown
    @required
    systems: Systems
}

structure CreateShipSystemScanInput {
    @httpLabel
    @required
    shipSymbol: String
}

structure CreateShipWaypointScan201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: CreateShipWaypointScan201Body
}

///
structure CreateShipWaypointScan201Body {
    @required
    data: CreateShipWaypointScan201BodyData
}

structure CreateShipWaypointScan201BodyData {
    @required
    cooldown: Cooldown
    @required
    waypoints: CreateShipWaypointScan201BodyDataWaypoints
}

structure CreateShipWaypointScanInput {
    @httpLabel
    @required
    shipSymbol: String
}

structure CreateSurvey201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: CreateSurvey201Body
}

structure CreateSurvey201Body {
    @required
    data: CreateSurvey201BodyData
}

structure CreateSurvey201BodyData {
    @required
    cooldown: Cooldown
    @required
    surveys: Surveys
}

structure CreateSurveyInput {
    /// The symbol of the ship
    @httpLabel
    @required
    shipSymbol: String
}

structure DeliverContract200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: DeliverContract200Body
}

///
structure DeliverContract200Body {
    @required
    data: DeliverContract200BodyData
}

structure DeliverContract200BodyData {
    @required
    contract: Contract
    @required
    cargo: ShipCargo
}

structure DeliverContractInput {
    /// The ID of the contract
    @httpLabel
    @required
    contractId: String
    @httpPayload
    @contentType("application/json")
    body: DeliverContractInputBody
}

structure DeliverContractInputBody {
    @required
    shipSymbol: String
    @required
    tradeSymbol: String
    @required
    units: Integer
}

structure DockShip200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: DockShip200Body
}

///
structure DockShip200Body {
    @required
    data: DockShip200BodyData
}

structure DockShip200BodyData {
    @required
    nav: ShipNav
}

structure DockShipInput {
    /// The symbol of the ship
    @httpLabel
    @required
    shipSymbol: String
}

/// The engine of the ship.
structure Engine {
    @required
    symbol: String
}

///
structure Extraction {
    @length(
        min: 1
    )
    @required
    shipSymbol: String
    @required
    yield: ExtractionYield
}

structure ExtractionYield {
    @length(
        min: 1
    )
    @required
    symbol: String
    /// The number of units extracted that were placed into the ship's cargo hold.
    @required
    units: Integer
}

structure ExtractResources201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: ExtractResources201Body
}

///
structure ExtractResources201Body {
    @required
    data: ExtractResources201BodyData
}

structure ExtractResources201BodyData {
    @required
    cooldown: Cooldown
    @required
    extraction: Extraction
    @required
    cargo: ShipCargo
}

structure ExtractResourcesInput {
    /// The ship symbol
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: ExtractResourcesInputBody
}

structure ExtractResourcesInputBody {
    survey: Survey
}

///
structure Faction {
    @length(
        min: 1
    )
    @required
    symbol: String
    @length(
        min: 1
    )
    @required
    name: String
    @length(
        min: 1
    )
    @required
    description: String
    @length(
        min: 1
    )
    @required
    headquarters: String
    @required
    traits: FactionTraits
    /// Whether or not the faction is currently recruiting new agents.
    @required
    isRecruiting: Boolean
}

structure FactionTrait {
    @required
    symbol: FactionTraitSymbol
    /// The name of the trait.
    @required
    name: String
    /// A description of the trait.
    @required
    description: String
}

/// The frame of the ship.
structure Frame {
    @required
    symbol: String
}

structure FulfillContract200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: FulfillContract200Body
}

///
structure FulfillContract200Body {
    @required
    data: FulfillContract200BodyData
}

structure FulfillContract200BodyData {
    @required
    agent: Agent
    @required
    contract: Contract
}

structure FulfillContractInput {
    /// The ID of the contract
    @httpLabel
    @required
    contractId: String
}

structure GetContract200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetContract200Body
}

structure GetContract200Body {
    @required
    data: Contract
}

structure GetContractInput {
    /// The contract ID
    @httpLabel
    @required
    contractId: String
}

structure GetContracts200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetContracts200Body
}

///
structure GetContracts200Body {
    @required
    data: GetContracts200BodyData
    @required
    meta: Meta
}

structure GetContractsInput {
    /// What entry offset to request
    @httpQuery("page")
    @range(
        min: 1
    )
    page: Integer
    /// How many entries to return per page
    @httpQuery("limit")
    @range(
        min: 1
        max: 20
    )
    limit: Integer
}

structure GetFaction200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetFaction200Body
}

structure GetFaction200Body {
    @required
    data: Faction
}

structure GetFactionInput {
    /// The faction symbol
    @httpLabel
    @required
    factionSymbol: String
}

structure GetFactions200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetFactions200Body
}

structure GetFactions200Body {
    @required
    data: GetFactions200BodyData
    @required
    meta: Meta
}

structure GetFactionsInput {
    /// What entry offset to request
    @httpQuery("page")
    @range(
        min: 1
    )
    page: Integer
    /// How many entries to return per page
    @httpQuery("limit")
    @range(
        min: 1
        max: 20
    )
    limit: Integer
}

structure GetJumpGate200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetJumpGate200Body
}

///
structure GetJumpGate200Body {
    @required
    data: JumpGate
}

structure GetJumpGateInput {
    /// The system symbol
    @httpLabel
    @required
    systemSymbol: String
    /// The waypoint symbol
    @httpLabel
    @required
    waypointSymbol: String
}

structure GetMarket200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetMarket200Body
}

structure GetMarket200Body {
    @required
    data: Market
}

structure GetMarketInput {
    /// The system symbol
    @httpLabel
    @required
    systemSymbol: String
    /// The waypoint symbol
    @httpLabel
    @required
    waypointSymbol: String
}

structure GetMyAgent200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetMyAgent200Body
}

structure GetMyAgent200Body {
    @required
    data: Agent
}

structure GetMyShip200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetMyShip200Body
}

///
structure GetMyShip200Body {
    @required
    data: Ship
}

structure GetMyShipCargo200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetMyShipCargo200Body
}

///
structure GetMyShipCargo200Body {
    @required
    data: ShipCargo
}

structure GetMyShipCargoInput {
    /// The symbol of the ship
    @httpLabel
    @required
    shipSymbol: String
}

structure GetMyShipInput {
    @httpLabel
    @required
    shipSymbol: String
}

structure GetMyShips200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetMyShips200Body
}

///
structure GetMyShips200Body {
    @required
    data: GetMyShips200BodyData
    @required
    meta: Meta
}

structure GetMyShipsInput {
    /// What entry offset to request
    @httpQuery("page")
    @range(
        min: 1
    )
    page: Integer
    /// How many entries to return per page
    @httpQuery("limit")
    @range(
        min: 1
        max: 20
    )
    limit: Integer
}

structure GetShipCooldown200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetShipCooldown200Body
}

///
structure GetShipCooldown200Body {
    @required
    data: Cooldown
}

structure GetShipCooldownInput {
    @httpLabel
    @required
    shipSymbol: String
}

structure GetShipNav200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetShipNav200Body
}

///
structure GetShipNav200Body {
    @required
    data: ShipNav
}

structure GetShipNavInput {
    /// The ship symbol
    @httpLabel
    @required
    shipSymbol: String
}

structure GetShipyard200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetShipyard200Body
}

///
structure GetShipyard200Body {
    @required
    data: Shipyard
}

structure GetShipyardInput {
    /// The system symbol
    @httpLabel
    @required
    systemSymbol: String
    /// The waypoint symbol
    @httpLabel
    @required
    waypointSymbol: String
}

structure GetStatus200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetStatus200Body
}

/// OK
structure GetStatus200Body {
    /// The current status of the game server.
    @required
    status: String
    /// The current version of the API.
    @required
    version: String
    /// The date and time when the game server was last reset.
    @required
    resetDate: String
    @required
    description: String
    @required
    stats: Stats
    @required
    leaderboards: Leaderboards
    @required
    serverResets: ServerResets
    @required
    announcements: Announcements
    @required
    links: Links
}

structure GetStatus200BodyAnnouncementsItem {
    @required
    title: String
    @required
    body: String
}

structure GetStatus200BodyLeaderboardsMostCreditsItem {
    @required
    agentSymbol: String
    @required
    credits: Integer
}

structure GetStatus200BodyLeaderboardsMostSubmittedChartsItem {
    @required
    agentSymbol: String
    @required
    chartCount: Integer
}

structure GetStatus200BodyLinksItem {
    @required
    name: String
    @required
    url: String
}

structure GetSystem200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetSystem200Body
}

///
structure GetSystem200Body {
    @required
    data: System
}

structure GetSystemInput {
    /// The system symbol
    @httpLabel
    @required
    systemSymbol: String
}

structure GetSystems200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetSystems200Body
}

///
structure GetSystems200Body {
    @required
    data: GetSystems200BodyData
    @required
    meta: Meta
}

structure GetSystemsInput {
    /// What entry offset to request
    @httpQuery("page")
    @range(
        min: 1
    )
    page: Integer
    /// How many entries to return per page
    @httpQuery("limit")
    @range(
        min: 1
        max: 20
    )
    limit: Integer
}

structure GetSystemWaypoints200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetSystemWaypoints200Body
}

///
structure GetSystemWaypoints200Body {
    @required
    data: GetSystemWaypoints200BodyData
    @required
    meta: Meta
}

structure GetSystemWaypointsInput {
    /// The system symbol
    @httpLabel
    @required
    systemSymbol: String
    /// What entry offset to request
    @httpQuery("page")
    @range(
        min: 1
    )
    page: Integer
    /// How many entries to return per page
    @httpQuery("limit")
    @range(
        min: 1
        max: 20
    )
    limit: Integer
}

structure GetWaypoint200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: GetWaypoint200Body
}

///
structure GetWaypoint200Body {
    @required
    data: Waypoint
}

structure GetWaypointInput {
    /// The system symbol
    @httpLabel
    @required
    systemSymbol: String
    /// The waypoint symbol
    @httpLabel
    @required
    waypointSymbol: String
}

structure Jettison200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: Jettison200Body
}

///
structure Jettison200Body {
    @required
    data: Jettison200BodyData
}

structure Jettison200BodyData {
    @required
    cargo: ShipCargo
}

structure JettisonInput {
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: JettisonInputBody
}

structure JettisonInputBody {
    @required
    symbol: String
    @range(
        min: 1
    )
    @required
    units: Integer
}

///
structure JumpGate {
    /// The maximum jump range of the gate.
    @required
    jumpRange: Double
    /// The symbol of the faction that owns the gate.
    factionSymbol: String
    @required
    connectedSystems: ConnectedSystems
}

structure JumpShip200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: JumpShip200Body
}

///
structure JumpShip200Body {
    @required
    data: JumpShip200BodyData
}

structure JumpShip200BodyData {
    @required
    cooldown: Cooldown
    nav: ShipNav
}

structure JumpShipInput {
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: JumpShipInputBody
}

structure JumpShipInputBody {
    /// The system symbol to jump to.
    @required
    systemSymbol: String
}

structure Leaderboards {
    @required
    mostCredits: MostCredits
    @required
    mostSubmittedCharts: MostSubmittedCharts
}

///
structure Market {
    /// The symbol of the market. The symbol is the same as the waypoint where the market is located.
    @required
    symbol: String
    @required
    exports: Exports
    @required
    imports: Imports
    @required
    exchange: Exchange
    transactions: MarketTransactions
    tradeGoods: TradeGoods
}

structure MarketTradeGood {
    /// The symbol of the trade good.
    @required
    symbol: String
    /// The typical volume flowing through the market for this type of good. The larger the trade volume, the more stable prices will be.
    @range(
        min: 1
    )
    @required
    tradeVolume: Integer
    @required
    supply: Supply
    /// The price at which this good can be purchased from the market.
    @range(
        min: 0
    )
    @required
    purchasePrice: Integer
    /// The price at which this good can be sold to the market.
    @range(
        min: 0
    )
    @required
    sellPrice: Integer
}

structure MarketTransaction {
    /// The symbol of the waypoint where the transaction took place.
    @required
    waypointSymbol: String
    /// The symbol of the ship that made the transaction.
    @required
    shipSymbol: String
    /// The symbol of the trade good.
    @required
    tradeSymbol: String
    @required
    type: MarketTransactionType
    /// The number of units of the transaction.
    @range(
        min: 0
    )
    @required
    units: Integer
    /// The price per unit of the transaction.
    @range(
        min: 0
    )
    @required
    pricePerUnit: Integer
    /// The total price of the transaction.
    @range(
        min: 0
    )
    @required
    totalPrice: Integer
    /// The timestamp of the transaction.
    @required
    @timestampFormat("date-time")
    timestamp: Timestamp
}

///
@openapiExtensions(
    "x-examples": {
        "example-1": {
            limit: 20
            total: 6
            page: 1
        }
    }
)
structure Meta {
    @required
    total: Integer
    @required
    page: Integer
    @required
    limit: Integer
}

structure NavigateShip200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: NavigateShip200Body
}

///
structure NavigateShip200Body {
    @required
    data: NavigateShip200BodyData
}

structure NavigateShip200BodyData {
    @required
    fuel: ShipFuel
    @required
    nav: ShipNav
}

structure NavigateShipInput {
    /// The ship symbol
    @httpLabel
    @required
    shipSymbol: String
    ///
    @httpPayload
    @contentType("application/json")
    body: NavigateShipInputBody
}

structure NavigateShipInputBody {
    /// The target destination.
    @required
    waypointSymbol: String
}

structure NegotiateContract201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: NegotiateContract201Body
}

///
structure NegotiateContract201Body {
    @required
    data: NegotiateContract201BodyData
}

structure NegotiateContract201BodyData {
    @required
    contract: Contract
}

structure NegotiateContractInput {
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: NegotiateContractInputBody
}

structure OrbitShip200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: OrbitShip200Body
}

///
structure OrbitShip200Body {
    @required
    data: OrbitShip200BodyData
}

structure OrbitShip200BodyData {
    @required
    nav: ShipNav
}

structure OrbitShipInput {
    /// The symbol of the ship
    @httpLabel
    @required
    shipSymbol: String
}

structure PatchShipNav200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: PatchShipNav200Body
}

///
structure PatchShipNav200Body {
    @required
    data: ShipNav
}

structure PatchShipNavInput {
    /// The ship symbol
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: PatchShipNavInputBody
}

structure PatchShipNavInputBody {
    flightMode: ShipNavFlightMode
}

structure PurchaseCargo201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: PurchaseCargo201Body
}

///
structure PurchaseCargo201Body {
    @required
    data: PurchaseCargo201BodyData
}

structure PurchaseCargo201BodyData {
    @required
    agent: Agent
    @required
    cargo: ShipCargo
    @required
    transaction: MarketTransaction
}

structure PurchaseCargoInput {
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: PurchaseCargoInputBody
}

structure PurchaseCargoInputBody {
    @required
    symbol: String
    @required
    units: Integer
}

structure PurchaseShip201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: PurchaseShip201Body
}

///
structure PurchaseShip201Body {
    @required
    data: PurchaseShip201BodyData
}

structure PurchaseShip201BodyData {
    @required
    agent: Agent
    @required
    ship: Ship
    @required
    transaction: ShipyardTransaction
}

structure PurchaseShipInput {
    @httpPayload
    @contentType("application/json")
    body: PurchaseShipInputBody
}

structure PurchaseShipInputBody {
    @required
    shipType: ShipType
    /// The symbol of the waypoint you want to purchase the ship at.
    @required
    waypointSymbol: String
}

/// The reactor of the ship.
structure Reactor {
    @required
    symbol: String
}

structure RefuelShip200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: RefuelShip200Body
}

///
structure RefuelShip200Body {
    @required
    data: RefuelShip200BodyData
}

structure RefuelShip200BodyData {
    @required
    agent: Agent
    @required
    fuel: ShipFuel
    @required
    transaction: MarketTransaction
}

structure RefuelShipInput {
    @httpLabel
    @required
    shipSymbol: String
}

structure Register201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: Register201Body
}

structure Register201Body {
    @required
    data: Register201BodyData
}

structure Register201BodyData {
    @required
    agent: Agent
    @required
    contract: Contract
    @required
    faction: Faction
    @required
    ship: Ship
    /// A Bearer token for accessing secured API endpoints.
    @required
    token: String
}

structure RegisterInput {
    ///
    @httpPayload
    @contentType("application/json")
    body: RegisterInputBody
}

structure RegisterInputBody {
    @required
    faction: RegisterInputBodyFaction
    /// How other agents will see your ships and information.
    @dataExamples([
        {
            json: "BADGER"
        }
    ])
    @length(
        min: 3
        max: 14
    )
    @required
    symbol: String
    /// Your email address. This is used if you reserved your call sign between resets.
    email: String
}

/// The ship that was scanned. Details include information about the ship that could be detected by the scanner.
structure ScannedShip {
    /// The globally unique identifier of the ship.
    @required
    symbol: String
    @required
    registration: ShipRegistration
    @required
    nav: ShipNav
    frame: Frame
    reactor: Reactor
    @required
    engine: Engine
    mounts: ScannedShipMounts
}

/// A mount on the ship.
structure ScannedShipMountsItem {
    @required
    symbol: String
}

///
structure ScannedSystem {
    @length(
        min: 1
    )
    @required
    symbol: String
    @length(
        min: 1
    )
    @required
    sectorSymbol: String
    @required
    type: SystemType
    @required
    x: Integer
    @required
    y: Integer
    @required
    distance: Integer
}

/// A waypoint is a location that ships can travel to such as a Planet, Moon or Space Station.
structure ScannedWaypoint {
    @length(
        min: 1
    )
    @required
    symbol: String
    @required
    type: WaypointType
    @length(
        min: 1
    )
    @required
    systemSymbol: String
    @required
    x: Integer
    @required
    y: Integer
    @required
    orbitals: ScannedWaypointOrbitals
    faction: WaypointFaction
    @required
    traits: ScannedWaypointTraits
    chart: Chart
}

structure SellCargo201 {
    @httpPayload
    @required
    @contentType("application/json")
    body: SellCargo201Body
}

///
structure SellCargo201Body {
    @required
    data: SellCargo201BodyData
}

structure SellCargo201BodyData {
    @required
    agent: Agent
    @required
    cargo: ShipCargo
    @required
    transaction: MarketTransaction
}

structure SellCargoInput {
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: SellCargoInputBody
}

structure SellCargoInputBody {
    @required
    symbol: String
    @required
    units: Integer
}

structure ServerResets {
    /// The date and time when the game server will reset.
    @required
    next: String
    /// How often we intend to reset the game server.
    @required
    frequency: String
}

/// A ship
structure Ship {
    /// The globally unique identifier of the ship in the following format: `[AGENT_SYMBOL]_[HEX_ID]`
    @required
    symbol: String
    @required
    registration: ShipRegistration
    @required
    nav: ShipNav
    @required
    crew: ShipCrew
    @required
    frame: ShipFrame
    @required
    reactor: ShipReactor
    @required
    engine: ShipEngine
    @required
    modules: ShipModules
    @required
    mounts: ShipMounts
    @required
    cargo: ShipCargo
    @required
    fuel: ShipFuel
}

structure ShipCargo {
    /// The max number of items that can be stored in the cargo hold.
    @range(
        min: 0
    )
    @required
    capacity: Integer
    /// The number of items currently stored in the cargo hold.
    @range(
        min: 0
    )
    @required
    units: Integer
    @required
    inventory: Inventory
}

/// The type of cargo item and the number of units.
structure ShipCargoItem {
    /// The unique identifier of the cargo item type.
    @required
    symbol: String
    /// The name of the cargo item type.
    @required
    name: String
    /// The description of the cargo item type.
    @required
    description: String
    /// The number of units of the cargo item.
    @range(
        min: 1
    )
    @required
    units: Integer
}

/// The ship's crew service and maintain the ship's systems and equipment.
structure ShipCrew {
    /// The current number of crew members on the ship.
    @required
    current: Integer
    /// The minimum number of crew members required to maintain the ship.
    @required
    required: Integer
    /// The maximum number of crew members the ship can support.
    @required
    capacity: Integer
    @required
    rotation: Rotation
    /// A rough measure of the crew's morale. A higher morale means the crew is happier and more productive. A lower morale means the ship is more prone to accidents.
    @range(
        min: 0
        max: 100
    )
    @required
    morale: Integer
    /// The amount of credits per crew member paid per hour. Wages are paid when a ship docks at a civilized waypoint.
    @range(
        min: 0
    )
    @required
    wages: Integer
}

/// The engine determines how quickly a ship travels between waypoints.
structure ShipEngine {
    @required
    symbol: ShipEngineSymbol
    @required
    name: String
    @required
    description: String
    condition: ShipCondition
    @range(
        min: 1
    )
    @required
    speed: Integer
    @required
    requirements: ShipRequirements
}

/// The frame of the ship. The frame determines the number of modules and mounting points of the ship, as well as base fuel capacity. As the condition of the frame takes more wear, the ship will become more sluggish and less maneuverable.
structure ShipFrame {
    @required
    symbol: ShipFrameSymbol
    @required
    name: String
    @required
    description: String
    condition: ShipCondition
    @range(
        min: 0
    )
    @required
    moduleSlots: Integer
    @range(
        min: 0
    )
    @required
    mountingPoints: Integer
    @range(
        min: 0
    )
    @required
    fuelCapacity: Integer
    @required
    requirements: ShipRequirements
}

/// Details of the ship's fuel tanks including how much fuel was consumed during the last transit or action.
structure ShipFuel {
    /// The current amount of fuel in the ship's tanks.
    @range(
        min: 0
    )
    @required
    current: Integer
    /// The maximum amount of fuel the ship's tanks can hold.
    @range(
        min: 0
    )
    @required
    capacity: Integer
    consumed: ShipFuelConsumed
}

structure ShipFuelConsumed {
    /// The amount of fuel consumed by the most recent transit or action.
    @range(
        min: 0
    )
    @required
    amount: Integer
    /// The time at which the fuel was consumed.
    @required
    @timestampFormat("date-time")
    timestamp: Timestamp
}

/// A module can be installed in a ship and provides a set of capabilities such as storage space or quarters for crew. Module installations are permanent.
structure ShipModule {
    @required
    symbol: ShipModuleSymbol
    @range(
        min: 0
    )
    capacity: Integer
    @range(
        min: 0
    )
    range: Integer
    @required
    name: String
    description: String
    @required
    requirements: ShipRequirements
}

/// A mount is installed on the exterier of a ship.
structure ShipMount {
    @required
    symbol: ShipMountSymbol
    @required
    name: String
    description: String
    @range(
        min: 0
    )
    strength: Integer
    deposits: ShipMountDeposits
    @required
    requirements: ShipRequirements
}

/// The navigation information of the ship.
structure ShipNav {
    /// The system symbol of the ship's current location.
    @required
    systemSymbol: String
    /// The waypoint symbol of the ship's current location, or if the ship is in-transit, the waypoint symbol of the ship's destination.
    @required
    waypointSymbol: String
    @required
    route: ShipNavRoute
    @required
    status: ShipNavStatus
    @required
    flightMode: ShipNavFlightMode
}

/// The routing information for the ship's most recent transit or current location.
structure ShipNavRoute {
    @required
    destination: ShipNavRouteWaypoint
    @required
    departure: ShipNavRouteWaypoint
    /// The date time of the ship's departure.
    @required
    @timestampFormat("date-time")
    departureTime: Timestamp
    /// The date time of the ship's arrival. If the ship is in-transit, this is the expected time of arrival.
    @required
    @timestampFormat("date-time")
    arrival: Timestamp
}

/// The destination or departure of a ships nav route.
structure ShipNavRouteWaypoint {
    @length(
        min: 1
    )
    @required
    symbol: String
    @required
    type: WaypointType
    @length(
        min: 1
    )
    @required
    systemSymbol: String
    @required
    x: Integer
    @required
    y: Integer
}

/// The reactor of the ship. The reactor is responsible for powering the ship's systems and weapons.
structure ShipReactor {
    @required
    symbol: ShipReactorSymbol
    @required
    name: String
    @required
    description: String
    condition: ShipCondition
    @range(
        min: 1
    )
    @required
    powerOutput: Integer
    @required
    requirements: ShipRequirements
}

structure ShipRefine200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: ShipRefine200Body
}

///
structure ShipRefine200Body {
    @required
    data: ShipRefine200BodyData
}

structure ShipRefine200BodyData {
    @required
    cargo: ShipCargo
    @required
    cooldown: Cooldown
    @required
    produced: Produced
    @required
    consumed: ShipRefine200BodyDataConsumed
}

structure ShipRefine200BodyDataConsumedItem {
    tradeSymbol: String
    units: Integer
}

structure ShipRefine200BodyDataProducedItem {
    tradeSymbol: String
    units: Integer
}

structure ShipRefineInput {
    /// The symbol of the ship
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: ShipRefineInputBody
}

structure ShipRefineInputBody {
    @required
    produce: Produce
}

/// The public registration information of the ship
structure ShipRegistration {
    /// The agent's registered name of the ship
    @length(
        min: 1
    )
    @required
    name: String
    /// The symbol of the faction the ship is registered with
    @length(
        min: 1
    )
    @required
    factionSymbol: String
    @required
    role: ShipRole
}

/// The requirements for installation on a ship
structure ShipRequirements {
    /// The amount of power required from the reactor.
    power: Integer
    /// The number of crew required for operation.
    crew: Integer
    /// The number of module slots required for installation.
    slots: Integer
}

///
structure Shipyard {
    /// The symbol of the shipyard. The symbol is the same as the waypoint where the shipyard is located.
    @length(
        min: 1
    )
    @required
    symbol: String
    @required
    shipTypes: ShipTypes
    transactions: ShipyardTransactions
    ships: ShipyardShips
}

///
structure ShipyardShip {
    type: ShipType
    @required
    name: String
    @required
    description: String
    @required
    purchasePrice: Integer
    @required
    frame: ShipFrame
    @required
    reactor: ShipReactor
    @required
    engine: ShipEngine
    @required
    modules: ShipyardShipModules
    @required
    mounts: ShipyardShipMounts
}

structure ShipyardShipTypesItem {
    type: ShipType
}

structure ShipyardTransaction {
    /// The symbol of the waypoint where the transaction took place.
    @required
    waypointSymbol: String
    /// The symbol of the ship that was purchased.
    @required
    shipSymbol: String
    /// The price of the transaction.
    @range(
        min: 0
    )
    @required
    price: Integer
    /// The symbol of the agent that made the transaction.
    @required
    agentSymbol: String
    /// The timestamp of the transaction.
    @required
    @timestampFormat("date-time")
    timestamp: Timestamp
}

structure Stats {
    @required
    agents: Integer
    @required
    ships: Integer
    @required
    systems: Integer
    @required
    waypoints: Integer
}

/// A resource survey of a waypoint, detailing a specific extraction location and the types of resources that can be found there.
structure Survey {
    /// A unique signature for the location of this survey. This signature is verified when attempting an extraction using this survey.
    @length(
        min: 1
    )
    @required
    signature: String
    /// The symbol of the waypoint that this survey is for.
    @length(
        min: 1
    )
    @required
    symbol: String
    @required
    deposits: SurveyDeposits
    /// The date and time when the survey expires. After this date and time, the survey will no longer be available for extraction.
    @required
    @timestampFormat("date-time")
    expiration: Timestamp
    @required
    size: Size
}

/// A surveyed deposit of a mineral or resource available for extraction.
structure SurveyDeposit {
    /// The symbol of the deposit.
    @required
    symbol: String
}

///
structure System {
    @length(
        min: 1
    )
    @required
    symbol: String
    @length(
        min: 1
    )
    @required
    sectorSymbol: String
    @required
    type: SystemType
    @required
    x: Integer
    @required
    y: Integer
    @required
    waypoints: SystemWaypoints
    @required
    factions: Factions
}

structure SystemFaction {
    @length(
        min: 1
    )
    @required
    symbol: String
}

structure SystemWaypoint {
    @required
    symbol: String
    @required
    type: WaypointType
    @required
    x: Integer
    @required
    y: Integer
}

structure TradeGood {
    @required
    symbol: TradeSymbol
    @required
    name: String
    @required
    description: String
}

structure TransferCargo200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: TransferCargo200Body
}

///
structure TransferCargo200Body {
    @required
    data: TransferCargo200BodyData
}

structure TransferCargo200BodyData {
    @required
    cargo: ShipCargo
}

structure TransferCargoInput {
    @httpLabel
    @required
    shipSymbol: String
    @httpPayload
    @contentType("application/json")
    body: TransferCargoInputBody
}

structure TransferCargoInputBody {
    @required
    tradeSymbol: String
    @required
    units: Integer
    @required
    shipSymbol: String
}

structure WarpShip200 {
    @httpPayload
    @required
    @contentType("application/json")
    body: WarpShip200Body
}

///
structure WarpShip200Body {
    @required
    data: WarpShip200BodyData
}

structure WarpShip200BodyData {
    @required
    fuel: ShipFuel
    @required
    nav: ShipNav
}

structure WarpShipInput {
    @httpLabel
    @required
    shipSymbol: String
    ///
    @httpPayload
    @contentType("application/json")
    body: WarpShipInputBody
}

structure WarpShipInputBody {
    /// The target destination.
    @required
    waypointSymbol: String
}

/// A waypoint is a location that ships can travel to such as a Planet, Moon or Space Station.
structure Waypoint {
    @length(
        min: 1
    )
    @required
    symbol: String
    @required
    type: WaypointType
    @length(
        min: 1
    )
    @required
    systemSymbol: String
    @required
    x: Integer
    @required
    y: Integer
    @required
    orbitals: WaypointOrbitals
    faction: WaypointFaction
    @required
    traits: WaypointTraits
    chart: Chart
}

structure WaypointFaction {
    @length(
        min: 1
    )
    @required
    symbol: String
}

/// An orbital is another waypoint that orbits a parent waypoint.
structure WaypointOrbital {
    @length(
        min: 1
    )
    @required
    symbol: String
}

structure WaypointTrait {
    @required
    symbol: WaypointTraitSymbol
    /// The name of the trait.
    @required
    name: String
    /// A description of the trait.
    @required
    description: String
}

list Announcements {
    member: GetStatus200BodyAnnouncementsItem
}

/// The systems within range of the gate that have a corresponding gate.
list ConnectedSystems {
    member: ConnectedSystem
}

list CreateShipShipScan201BodyDataShips {
    member: ScannedShip
}

list CreateShipWaypointScan201BodyDataWaypoints {
    member: ScannedWaypoint
}

list Deliver {
    member: ContractDeliverGood
}

/// The list of goods that are bought and sold between agents at this market.
list Exchange {
    member: TradeGood
}

/// The list of goods that are exported from this market.
list Exports {
    member: TradeGood
}

list Factions {
    member: SystemFaction
}

list FactionTraits {
    member: FactionTrait
}

list GetContracts200BodyData {
    member: Contract
}

list GetFactions200BodyData {
    member: Faction
}

list GetMyShips200BodyData {
    member: Ship
}

list GetSystems200BodyData {
    member: System
}

list GetSystemWaypoints200BodyData {
    member: Waypoint
}

/// The list of goods that are sought as imports in this market.
list Imports {
    member: TradeGood
}

/// The items currently in the cargo hold.
list Inventory {
    member: ShipCargoItem
}

list Links {
    member: GetStatus200BodyLinksItem
}

/// The list of recent transactions at this market. Visible only when a ship is present at the market.
list MarketTransactions {
    member: MarketTransaction
}

list MostCredits {
    member: GetStatus200BodyLeaderboardsMostCreditsItem
}

list MostSubmittedCharts {
    member: GetStatus200BodyLeaderboardsMostSubmittedChartsItem
}

list Produced {
    member: ShipRefine200BodyDataProducedItem
}

list ScannedShipMounts {
    member: ScannedShipMountsItem
}

list ScannedWaypointOrbitals {
    member: WaypointOrbital
}

/// The traits of the waypoint.
list ScannedWaypointTraits {
    member: WaypointTrait
}

list ShipModules {
    member: ShipModule
}

list ShipMountDeposits {
    member: ShipMountDepositsItem
}

list ShipMounts {
    member: ShipMount
}

list ShipRefine200BodyDataConsumed {
    member: ShipRefine200BodyDataConsumedItem
}

/// The list of ship types available for purchase at this shipyard.
list ShipTypes {
    member: ShipyardShipTypesItem
}

list ShipyardShipModules {
    member: ShipModule
}

list ShipyardShipMounts {
    member: ShipMount
}

/// The ships that are currently available for purchase at the shipyard.
list ShipyardShips {
    member: ShipyardShip
}

/// The list of recent transactions at this shipyard.
list ShipyardTransactions {
    member: ShipyardTransaction
}

/// A list of deposits that can be found at this location.
list SurveyDeposits {
    member: SurveyDeposit
}

list Surveys {
    member: Survey
}

list Systems {
    member: ScannedSystem
}

list SystemWaypoints {
    member: SystemWaypoint
}

/// The list of goods that are traded at this market. Visible only when a ship is present at the market.
list TradeGoods {
    member: MarketTradeGood
}

list WaypointOrbitals {
    member: WaypointOrbital
}

/// The traits of the waypoint.
list WaypointTraits {
    member: WaypointTrait
}

enum ContractType {
    PROCUREMENT
    TRANSPORT
    SHUTTLE
}

/// The unique identifier of the trait.
enum FactionTraitSymbol {
    BUREAUCRATIC
    SECRETIVE
    CAPITALISTIC
    INDUSTRIOUS
    PEACEFUL
    DISTRUSTFUL
    WELCOMING
    SMUGGLERS
    SCAVENGERS
    REBELLIOUS
    EXILES
    PIRATES
    RAIDERS
    CLAN
    GUILD
    DOMINION
    FRINGE
    FORSAKEN
    ISOLATED
    LOCALIZED
    ESTABLISHED
    NOTABLE
    DOMINANT
    INESCAPABLE
    INNOVATIVE
    BOLD
    VISIONARY
    CURIOUS
    DARING
    EXPLORATORY
    RESOURCEFUL
    FLEXIBLE
    COOPERATIVE
    UNITED
    STRATEGIC
    INTELLIGENT
    RESEARCH_FOCUSED
    COLLABORATIVE
    PROGRESSIVE
    MILITARISTIC
    TECHNOLOGICALLY_ADVANCED
    AGGRESSIVE
    IMPERIALISTIC
    TREASURE_HUNTERS
    DEXTEROUS
    UNPREDICTABLE
    BRUTAL
    FLEETING
    ADAPTABLE
    SELF_SUFFICIENT
    DEFENSIVE
    PROUD
    DIVERSE
    INDEPENDENT
    SELF_INTERESTED
    FRAGMENTED
    COMMERCIAL
    FREE_MARKETS
    ENTREPRENEURIAL
}

/// The type of transaction.
enum MarketTransactionType {
    PURCHASE
    SELL
}

enum Produce {
    IRON
    COPPER
    SILVER
    GOLD
    ALUMINUM
    PLATINUM
    URANITE
    MERITIUM
    FUEL
}

/// The rotation of crew shifts. A stricter shift improves the ship's performance. A more relaxed shift improves the crew's morale.
enum Rotation {
    STRICT
    RELAXED
}

/// Condition is a range of 0 to 100 where 0 is completely worn out and 100 is brand new.
@range(
    min: 0
    max: 100
)
integer ShipCondition

enum ShipEngineSymbol {
    ENGINE_IMPULSE_DRIVE_I
    ENGINE_ION_DRIVE_I
    ENGINE_ION_DRIVE_II
    ENGINE_HYPER_DRIVE_I
}

enum ShipFrameSymbol {
    FRAME_PROBE
    FRAME_DRONE
    FRAME_INTERCEPTOR
    FRAME_RACER
    FRAME_FIGHTER
    FRAME_FRIGATE
    FRAME_SHUTTLE
    FRAME_EXPLORER
    FRAME_MINER
    FRAME_LIGHT_FREIGHTER
    FRAME_HEAVY_FREIGHTER
    FRAME_TRANSPORT
    FRAME_DESTROYER
    FRAME_CRUISER
    FRAME_CARRIER
}

enum ShipModuleSymbol {
    MODULE_MINERAL_PROCESSOR_I
    MODULE_CARGO_HOLD_I
    MODULE_CREW_QUARTERS_I
    MODULE_ENVOY_QUARTERS_I
    MODULE_PASSENGER_CABIN_I
    MODULE_MICRO_REFINERY_I
    MODULE_ORE_REFINERY_I
    MODULE_FUEL_REFINERY_I
    MODULE_SCIENCE_LAB_I
    MODULE_JUMP_DRIVE_I
    MODULE_JUMP_DRIVE_II
    MODULE_JUMP_DRIVE_III
    MODULE_WARP_DRIVE_I
    MODULE_WARP_DRIVE_II
    MODULE_WARP_DRIVE_III
    MODULE_SHIELD_GENERATOR_I
    MODULE_SHIELD_GENERATOR_II
}

enum ShipMountDepositsItem {
    QUARTZ_SAND
    SILICON_CRYSTALS
    PRECIOUS_STONES
    ICE_WATER
    AMMONIA_ICE
    IRON_ORE
    COPPER_ORE
    SILVER_ORE
    ALUMINUM_ORE
    GOLD_ORE
    PLATINUM_ORE
    DIAMONDS
    URANITE_ORE
    MERITIUM_ORE
}

enum ShipMountSymbol {
    MOUNT_GAS_SIPHON_I
    MOUNT_GAS_SIPHON_II
    MOUNT_GAS_SIPHON_III
    MOUNT_SURVEYOR_I
    MOUNT_SURVEYOR_II
    MOUNT_SURVEYOR_III
    MOUNT_SENSOR_ARRAY_I
    MOUNT_SENSOR_ARRAY_II
    MOUNT_SENSOR_ARRAY_III
    MOUNT_MINING_LASER_I
    MOUNT_MINING_LASER_II
    MOUNT_MINING_LASER_III
    MOUNT_LASER_CANNON_I
    MOUNT_MISSILE_LAUNCHER_I
    MOUNT_TURRET_I
}

/// The ship's set speed when traveling between waypoints or systems.
enum ShipNavFlightMode {
    DRIFT
    STEALTH
    CRUISE
    BURN
}

/// The current status of the ship
enum ShipNavStatus {
    IN_TRANSIT
    IN_ORBIT
    DOCKED
}

enum ShipReactorSymbol {
    REACTOR_SOLAR_I
    REACTOR_FUSION_I
    REACTOR_FISSION_I
    REACTOR_CHEMICAL_I
    REACTOR_ANTIMATTER_I
}

/// The registered role of the ship
enum ShipRole {
    FABRICATOR
    HARVESTER
    HAULER
    INTERCEPTOR
    EXCAVATOR
    TRANSPORT
    REPAIR
    SURVEYOR
    COMMAND
    CARRIER
    PATROL
    SATELLITE
    EXPLORER
    REFINERY
}

///
enum ShipType {
    SHIP_PROBE
    SHIP_MINING_DRONE
    SHIP_INTERCEPTOR
    SHIP_LIGHT_HAULER
    SHIP_COMMAND_FRIGATE
    SHIP_EXPLORER
    SHIP_HEAVY_FREIGHTER
    SHIP_LIGHT_SHUTTLE
    SHIP_ORE_HOUND
    SHIP_REFINING_FREIGHTER
}

/// The size of the deposit. This value indicates how much can be extracted from the survey before it is exhausted.
enum Size {
    SMALL
    MODERATE
    LARGE
}

/// A rough estimate of the total supply of this good in the marketplace.
enum Supply {
    SCARCE
    LIMITED
    MODERATE
    ABUNDANT
}

/// The type of waypoint.
enum SystemType {
    NEUTRON_STAR
    RED_STAR
    ORANGE_STAR
    BLUE_STAR
    YOUNG_STAR
    WHITE_DWARF
    BLACK_HOLE
    HYPERGIANT
    NEBULA
    UNSTABLE
}

enum TradeSymbol {
    PRECIOUS_STONES
    QUARTZ_SAND
    SILICON_CRYSTALS
    AMMONIA_ICE
    LIQUID_HYDROGEN
    LIQUID_NITROGEN
    ICE_WATER
    EXOTIC_MATTER
    ADVANCED_CIRCUITRY
    GRAVITON_EMITTERS
    IRON
    IRON_ORE
    COPPER
    COPPER_ORE
    ALUMINUM
    ALUMINUM_ORE
    SILVER
    SILVER_ORE
    GOLD
    GOLD_ORE
    PLATINUM
    PLATINUM_ORE
    DIAMONDS
    URANITE
    URANITE_ORE
    MERITIUM
    MERITIUM_ORE
    HYDROCARBON
    ANTIMATTER
    FERTILIZERS
    FABRICS
    FOOD
    JEWELRY
    MACHINERY
    FIREARMS
    ASSAULT_RIFLES
    MILITARY_EQUIPMENT
    EXPLOSIVES
    LAB_INSTRUMENTS
    AMMUNITION
    ELECTRONICS
    SHIP_PLATING
    EQUIPMENT
    FUEL
    MEDICINE
    DRUGS
    CLOTHING
    MICROPROCESSORS
    PLASTICS
    POLYNUCLEOTIDES
    BIOCOMPOSITES
    NANOBOTS
    AI_MAINFRAMES
    QUANTUM_DRIVES
    ROBOTIC_DRONES
    CYBER_IMPLANTS
    GENE_THERAPEUTICS
    NEURAL_CHIPS
    MOOD_REGULATORS
    VIRAL_AGENTS
    MICRO_FUSION_GENERATORS
    SUPERGRAINS
    LASER_RIFLES
    HOLOGRAPHICS
    SHIP_SALVAGE
    RELIC_TECH
    NOVEL_LIFEFORMS
    BOTANICAL_SPECIMENS
    CULTURAL_ARTIFACTS
    REACTOR_SOLAR_I
    REACTOR_FUSION_I
    REACTOR_FISSION_I
    REACTOR_CHEMICAL_I
    REACTOR_ANTIMATTER_I
    ENGINE_IMPULSE_DRIVE_I
    ENGINE_ION_DRIVE_I
    ENGINE_ION_DRIVE_II
    ENGINE_HYPER_DRIVE_I
    MODULE_MINERAL_PROCESSOR_I
    MODULE_CARGO_HOLD_I
    MODULE_CREW_QUARTERS_I
    MODULE_ENVOY_QUARTERS_I
    MODULE_PASSENGER_CABIN_I
    MODULE_MICRO_REFINERY_I
    MODULE_ORE_REFINERY_I
    MODULE_FUEL_REFINERY_I
    MODULE_SCIENCE_LAB_I
    MODULE_JUMP_DRIVE_I
    MODULE_JUMP_DRIVE_II
    MODULE_JUMP_DRIVE_III
    MODULE_WARP_DRIVE_I
    MODULE_WARP_DRIVE_II
    MODULE_WARP_DRIVE_III
    MODULE_SHIELD_GENERATOR_I
    MODULE_SHIELD_GENERATOR_II
    MOUNT_GAS_SIPHON_I
    MOUNT_GAS_SIPHON_II
    MOUNT_GAS_SIPHON_III
    MOUNT_SURVEYOR_I
    MOUNT_SURVEYOR_II
    MOUNT_SURVEYOR_III
    MOUNT_SENSOR_ARRAY_I
    MOUNT_SENSOR_ARRAY_II
    MOUNT_SENSOR_ARRAY_III
    MOUNT_MINING_LASER_I
    MOUNT_MINING_LASER_II
    MOUNT_MINING_LASER_III
    MOUNT_LASER_CANNON_I
    MOUNT_MISSILE_LAUNCHER_I
    MOUNT_TURRET_I
}

/// The unique identifier of the trait.
enum WaypointTraitSymbol {
    UNCHARTED
    MARKETPLACE
    SHIPYARD
    OUTPOST
    SCATTERED_SETTLEMENTS
    SPRAWLING_CITIES
    MEGA_STRUCTURES
    OVERCROWDED
    HIGH_TECH
    CORRUPT
    BUREAUCRATIC
    TRADING_HUB
    INDUSTRIAL
    BLACK_MARKET
    RESEARCH_FACILITY
    MILITARY_BASE
    SURVEILLANCE_OUTPOST
    EXPLORATION_OUTPOST
    MINERAL_DEPOSITS
    COMMON_METAL_DEPOSITS
    PRECIOUS_METAL_DEPOSITS
    RARE_METAL_DEPOSITS
    METHANE_POOLS
    ICE_CRYSTALS
    EXPLOSIVE_GASES
    STRONG_MAGNETOSPHERE
    VIBRANT_AURORAS
    SALT_FLATS
    CANYONS
    PERPETUAL_DAYLIGHT
    PERPETUAL_OVERCAST
    DRY_SEABEDS
    MAGMA_SEAS
    SUPERVOLCANOES
    ASH_CLOUDS
    VAST_RUINS
    MUTATED_FLORA
    TERRAFORMED
    EXTREME_TEMPERATURES
    EXTREME_PRESSURE
    DIVERSE_LIFE
    SCARCE_LIFE
    FOSSILS
    WEAK_GRAVITY
    STRONG_GRAVITY
    CRUSHING_GRAVITY
    TOXIC_ATMOSPHERE
    CORROSIVE_ATMOSPHERE
    BREATHABLE_ATMOSPHERE
    JOVIAN
    ROCKY
    VOLCANIC
    FROZEN
    SWAMP
    BARREN
    TEMPERATE
    JUNGLE
    OCEAN
    STRIPPED
}

/// The type of waypoint.
enum WaypointType {
    PLANET
    GAS_GIANT
    MOON
    ORBITAL_STATION
    JUMP_GATE
    ASTEROID_FIELD
    NEBULA
    DEBRIS_FIELD
    GRAVITY_WELL
}
