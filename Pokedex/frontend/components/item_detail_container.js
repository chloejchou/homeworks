import { connect } from 'react-redux';
import ItemDetail from './item_detail';
import { selectPokemonItem } from '../reducers/selectors';

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, parseInt(ownProps.params.itemId))
});

const mapDispatchToProps = (dispatch) => ({});

export default connect(mapStateToProps, mapDispatchToProps)(ItemDetail);
