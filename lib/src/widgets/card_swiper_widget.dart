import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({ @required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return  new ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index){
        peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
        return Container(
          width: 200.0,
          height: 180.0,
          padding: EdgeInsets.only(
              top: 6.0,
              bottom:6.0,
              right: 12.0,
              left: 12.0
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            elevation: 5,
            child: Container(
              height: 180.0,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 180.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)
                        ),
                    ),
                    child: _leftSection(context, index),
                  ),
                  Container(
                    height: 130,
                    width: 185,
                    child: _rightSection(context, index),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: peliculas.length,
    );
  }

  Widget _leftSection(BuildContext context,int index) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15.0),
        topLeft: Radius.circular(15.0),
      ),
      child: Container(
        alignment: FractionalOffset.centerLeft,
        child: FadeInImage(
          image: NetworkImage(peliculas[index].getBackgroundImg()),
          placeholder: AssetImage('assets/img/no-image-featured.png'),
          fit: BoxFit.fitHeight,
          height: MediaQuery.of(context).size.height/2,
        ),
      ),
    );
  }

  Widget _rightSection(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 2,0, 0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
                child: Text(
                  peliculas[index].title,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:6.0),
            child: Row(
              children: <Widget>[
                Text(
                    peliculas[index].voteAverage.toString(),
                    style: TextStyle(
                      color: Colors.lightBlue[300],
                      fontSize: 30.0
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(DateFormat.MMMMd().format(DateTime.parse(peliculas[index].releaseDate)), style: Theme.of(context).textTheme.subhead,),
                )
               ],
            ),
          )
        ],
      ),
    );
  }


}
